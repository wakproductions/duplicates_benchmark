## Duplicates Algorithm Benchmark

This is a response to a programming question I encountered during an interview. The question posed was to
explain what's going on in a Ruby function and rewrite it to be more understandable. I shared this with
several other developers and received a variety of responses. Someone suggested benchmarking them, so
here we go. To run the benchmark:

    > bundle install
    > ruby run/run.rb


### Programming Exercise - Original Problem

This is an exercise in software archeology. Start with this cryptic Ruby function:

    def function(a)
    a.inject({}){ |a,b| a[b] = a[b].to_i + 1; a}.\
    reject{ |a,b| b == 1 }.keys
    end

Or, if you prefer, this equally puzzling Python function:

    def function(a):
        def f1(a, b): a[b] = (a.get(b) or 0) + 1; return a
        return map(lambda a: a[0], filter(lambda a: not a[1] == 1,
        reduce(f1, a, {}).items()))


Please write a paragraph explaining what it does and how it works. Then, rewrite it so that it's
beautiful and elegant and the intent is clear. Feel free to use any references or tools you would
normally use.

### Benchmark Results

Here are the results I got from running the benchmark test on my Macbook Pro using the gem Tach. There was a
notable difference in the environment that I ran the test. On the first try, I ran it in the RubyMine IDE
with the debugger on, TIMES=100_000.

      +--------------------+-----------+
      | tach               | total     |
      +--------------------+-----------+
      | Kyle               | 14.659246 |
      +--------------------+-----------+
      | Isaac              | 15.174941 |
      +--------------------+-----------+
      | Kyle (monkeypatch) | 15.592371 |
      +--------------------+-----------+
      | Winston            | 28.022580 |
      +--------------------+-----------+
      | Miles              | 28.038646 |
      +--------------------+-----------+
      | Original           | 28.067250 |
      +--------------------+-----------+
      | Mack               | 30.655075 |
      +--------------------+-----------+
      | Corin              | 33.670075 |
      +--------------------+-----------+

Running it in IRB through a Terminal window was much faster. In fact, it was so much faster that I increased
TIMES tenfold to 1_000_000. Surprisingly, Mack's algorithm had a significant improvement in performance without
the debugger running. However, Kyle's algorithm was near the top in both environments.

      +--------------------+-----------+
      | tach               | total     |
      +--------------------+-----------+
      | Mack               | 28.019534 |
      +--------------------+-----------+
      | Kyle               | 28.662758 |
      +--------------------+-----------+
      | Kyle (monkeypatch) | 28.843314 |
      +--------------------+-----------+
      | Isaac              | 29.165758 |
      +--------------------+-----------+
      | Winston            | 36.408868 |
      +--------------------+-----------+
      | Original           | 36.416911 |
      +--------------------+-----------+
      | Miles              | 36.565692 |
      +--------------------+-----------+
      | Corin              | 37.336426 |
      +--------------------+-----------+

The input data was a simple array of strings:

    INPUT = ['yes'] * 100 + ['no'] * 50 + ['maybe'] + ['so']

It would be interesting to see how these benchmarks perform on a variety of data sets. I would imagine that the
number of duplicates and size of the input might change these rankings. Another idea worth investigating is whether
using the (nil).to_i call to get "0" in inefficient. Ruby might be handling an exception under the hood before
retuning "0", which has more system resource overhead. I'll leave such studies for another day. Feel
free to make a pull request if you've got a cool idea to add!
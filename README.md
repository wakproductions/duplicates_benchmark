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
      | Kyle               | 14.818869 |
      +--------------------+-----------+
      | Isaac              | 15.070097 |
      +--------------------+-----------+
      | Kyle (monkeypatch) | 16.597024 |
      +--------------------+-----------+
      | Winston            | 26.808144 |
      +--------------------+-----------+
      | Miles              | 26.874811 |
      +--------------------+-----------+
      | Original           | 27.150746 |
      +--------------------+-----------+
      | Mack               | 31.517404 |
      +--------------------+-----------+

Running it in IRB through a Terminal window was much faster. In fact, it was so much faster that I increased
TIMES tenfold to 1_000_000. Surprisingly, Mack's algorithm had a significant improvement in performance without
the debugger running. However, Kyle's algorithm was near the top in both environments.

      +--------------------+-----------+
      | tach               | total     |
      +--------------------+-----------+
      | Mack               | 27.587715 |
      +--------------------+-----------+
      | Kyle (monkeypatch) | 28.354408 |
      +--------------------+-----------+
      | Kyle               | 28.539068 |
      +--------------------+-----------+
      | Isaac              | 29.204867 |
      +--------------------+-----------+
      | Winston            | 35.942340 |
      +--------------------+-----------+
      | Original           | 36.033839 |
      +--------------------+-----------+
      | Miles              | 36.238827 |
      +--------------------+-----------+

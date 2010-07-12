ActiveLog
=========
You need ActiveLog when you want to automagically create changelog of all activerecord changes in your rails app, asynchronously. It will keep track of all changes on attributes and as a bonus it can also record which user (session's current_user) made the change.

Example
-------

add "records\_active_log" to all models which needs to be logged
<pre><code>
class User < ActiveRecord::Base

  records_active_log

end
</code></pre>

You can access logs either by user or all...

<pre>
	>>u = User.first
	>>u.active_logs
	=> [...]
	
	or
	
	>> ActiveLog.all

</pre>

If you want to log along with information of currently logged in user then you should consider adding a before filter to application controller which sets ActiveLog.current = current_user


Copyright (c) 2010 Abhishek Parolkar, released under the MIT license

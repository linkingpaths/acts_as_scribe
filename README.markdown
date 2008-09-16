ActsAsScribe
============
A simple plugin that allows to keep history records of the users activities. Common uses could be user's wall, public timeline portlets, etc...

> Scribe (From Wikipedia, the free encyclopedia):
"A scribe was traditionally a person who could read and write. This usually indicated secretarial and administrative duties such as dictation and keeping business, judicial, and history records for kings, nobles, temples, and cities."

Resources
=========

Install
-------
 
 * Run the following command:
 
 `script/plugin install git://github.com/linkingpaths/acts_as_scribe.git`
 
 * Generate the tables via the given generator:

 `script/generate acts_as_scribe_migration`
 
 * And finally...
 
 `rake db:migrate`
 
Usage
-----
 
 * Make your ActiveRecord model acts as scribe.
<pre>
  class Comment < ActiveRecord::Base    
    record_activity_of :user
  end
</pre>

 * If you want to record activities not related to any specific model just use `record_activities :activity` in your user model:
<pre>
  class User < ActiveRecord::Base
    record_activities [:featured_on_home, :logged_in, :logged_out]
  end
</pre>
 


More
-------

[http://github.com/linkingpaths/acts\_as\_scribe](http://github.com/linkingpaths/acts_as_scribe)

[http://github.com/linkingpaths/acts\_as\_scribe/wikis](http://github.com/linkingpaths/acts_as_scribe/wikis)


Copyright (c) 2008 Linking Paths, released under the MIT license
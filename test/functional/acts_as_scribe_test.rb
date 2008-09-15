require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ActsAsScribeTest < Test::Unit::TestCase

  def setup
    setup_db
    @user = User.create(:login => "m.thatcher")
    @jaiku = create_jaiku
  end

  def teardown
    teardown_db
  end
  def test_acts_as_scribe_include
    assert @jaiku.respond_to?(:activities, "Jaiku should responds_to :activities")
    assert @jaiku.respond_to?(:create_activity_from_self, "Jaiku should responds_to :create_activity_from_self")
    assert @jaiku.respond_to?(:track_activity, "Jaiku should responds_to :track_activity")
  end

  def test_activity_create_correctly
    assert_equal 1, @jaiku.activities.size, "Create a jaiku should create a new activity"
  end
  
  def test_activity_should_be_linked_to_user
    assert_equal @user, @jaiku.activities.first.user, "The activity should be registered as made by the user that create the jaiku"
  end
  
  def test_activity_record_the_item_tracked_correctly
    assert_equal "Jaiku", @jaiku.activities.first.item_type, "The activity should be linked to the first jaiku"
    assert_equal 1, @jaiku.activities.first.item_id, "The activity should be linked to the first jaiku"
  end
  
  def test_use_not_tracked_activities_should_raise_an_exception
    assert_raise RuntimeError do
        @user.track_activity :not_defined_featured
    end
  end

  def test_registered_action_should_create_an_unlinked_activity
    @user.track_activity :featured_on_home
    puts @user.activities.inspect
    assert_equal 1, @user.unlinked_activities.size,  "Track an unlinked activity should create a new activity on the user model"
  end
  
  protected 
  def create_jaiku
    Jaiku.create(:content => "To solve Britain’s economic Disease with Socialism is like treating leukaemia with leeches.", :user => @user)
  end
end
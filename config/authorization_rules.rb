authorization do
  role :guest do
    has_permission_on [:lectures], :to => [:show, :vote_increment]
    has_permission_on [:events], :to => [:index, :show]
    has_permission_on [:users], :to => [:index]
    has_permission_on [:users], :to => [:index, :show] do
      if_attribute :roles => { :title => is { "admin" } }
      if_attribute :roles => { :title => is { "member" } }
    end
  end

  role :member do
    includes :guest
    has_permission_on [:users], :to => [:index, :show]
    has_permission_on [:events], :to => [:show]
    has_permission_on [:lectures], :to =>  [:new, :create, :edit, :update, :destroy, :index ]
  end

  role :admin do
    includes :member
    has_permission_on [:users], :to => [:index, :edit, :update, :change]
    has_permission_on [:events], :to => [:new, :create, :edit, :update, :destroy, :index, :show, :vote_increment]
    has_permission_on [:posts], :to => [:new, :create, :edit, :update, :destroy, :index, :show, :vote_increment]
    has_permission_on [:welcome], :to => [:index]
  end
end


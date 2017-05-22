module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'}
    ]} if @current_role_user.present? and @current_role_user.is_admin?
    children = [{:name => 'Экскурсии',
       :controller => :excursions, :action => :index,
       :icon => 'bank'},
       {:name => 'Туры',
       :controller => :tours, :action => :index,
       :icon => 'bus'}]
    if @current_role_user.present? and @current_role_user.is_admin?
      children << {:name => 'Города',
       :controller => :cities, :action => :index,
       :icon => 'building-o',
       :class => 'long'}
     children << {:name => 'Маршруты',
       :controller => :routes, :action => :index,
       :icon => 'map-o',
       :class => 'long'}
    end
    result << {
      :name => 'База данных',
      :icon => 'database',
      :children => children} if @current_role_user.present?
    result << {
      :name => 'Поиск',
      :icon => 'search-plus',
      :children => [
      {:name => 'Поиск туров',
       :controller => :tours, :action => :search,
       :icon => 'search',
       :class => 'long'}
    ]} if @current_role_user.present?
    result 
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end

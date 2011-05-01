Sequel.migration do

  up do
    # Inser the categories
    category_group_id = Zen::Database.handle[:category_groups].insert(
      :name => 'Blog', :description => 'Categories for the blog.'
    )

    Zen::Database.handle[:categories].insert(
      :name => 'Release', :description => 'Category that should be used whenever an 
      article is about a new version of Ramaze.', :category_group_id => category_group_id
    )

    # Insert all custom fields
    field_group_id_0 = Zen::Database.handle[:custom_field_groups].insert(
      :name => 'General', :description => 'General custom fields that can be shared 
      across multiple sections.'
    )

    field_group_id_1 = Zen::Database.handle[:custom_field_groups].insert(
      :name => 'Feature Blocks', :description => 'The custom fields for the grid at the 
      bottom of each page that contains more information about the features of Ramaze.'
    )

    field_group_id_2 = Zen::Database.handle[:custom_field_groups].insert(
      :name => 'Pages', :description => 'Custom fields for static pages.'
    )

    Zen::Database.handle[:custom_fields].insert(
      :name => 'Body', :slug => 'body', :description => 'The main content of each entry.', 
      :type => 'textarea', :format => 'markdown', :required => true, 
      :visual_editor => true, :textarea_rows => 20, 
      :custom_field_group_id => field_group_id_0
    )

    Zen::Database.handle[:custom_fields].insert(
      :name => 'Top Left', :slug => 'top-left', :type => 'textarea', :format => 'html', 
      :required => true,  :visual_editor => true, :textarea_rows => 10, 
      :custom_field_group_id => field_group_id_1
    )

    Zen::Database.handle[:custom_fields].insert(
      :name => 'Top Right', :slug => 'top-right', :type => 'textarea', :format => 'html', 
      :required => true, :visual_editor => true, :textarea_rows => 10, 
      :custom_field_group_id => field_group_id_1
    )

    Zen::Database.handle[:custom_fields].insert(
      :name => 'Bottom left', :slug => 'bottom-left', :type => 'textarea', 
      :format => 'html', :required => true, :visual_editor => true, :textarea_rows => 10, 
      :custom_field_group_id => field_group_id_1
    )

    Zen::Database.handle[:custom_fields].insert(
      :name => 'Bottom Right', :slug => 'bottom-right', :type => 'textarea', 
      :format => 'html', :required => true, :visual_editor => true, :textarea_rows => 10, 
      :custom_field_group_id => field_group_id_1
    )

    Zen::Database.handle[:custom_fields].insert(
      :name => 'CSS ID', :slug => 'css-id', 
      :description => 'An ID to apply to the body element of each page.', 
      :type => 'textbox', :format => 'plain', :required => false, :visual_editor => false,
      :custom_field_group_id => field_group_id_2
    )

    # Insert the navigation menu
    menu_id = Zen::Database.handle[:menus].insert(
      :name => 'Main', :description => 'The main navigation menu.', :slug => 'main'
    )

    Zen::Database.handle[:menu_items].insert_multiple(
    [
      {
        :name => 'Home', :url => '/', :order => 0, :menu_id => menu_id
      },
      {
        :name => 'Documentation', :url => '/documentation/index.html', :order => 1, 
        :menu_id => menu_id
      },
      {
        :name => 'Community', :url => '/community', :order => 2, :menu_id => menu_id
      },
      {
        :name => 'GitHub', :url => 'https://github.com/ramaze/ramaze', :order => 3,
        :menu_id => menu_id
      },
      {
        :name => 'Blog', :url => '/blog', :order => 4, :menu_id => menu_id
      }
    ])

    # Insert all sections
    section_id_0 = Zen::Database.handle[:sections].insert(
      :name => 'Pages', :description => 'Static content such as the homepage.',
      :comment_allow => false, :comment_require_account => false, 
      :comment_moderate => false, :slug => 'pages'
    )

    section_id_1 = Zen::Database.handle[:sections].insert(
      :name => 'Blog', :description => 'News articles, showcases, etc.',
      :comment_allow => true, :comment_require_account => false, 
      :comment_moderate => true, :slug => 'blog'
    )

    # Link all groups to the correct sections
    Zen::Database.handle[:category_groups_sections].insert(
      :section_id => section_id_1, :category_group_id => category_group_id
    )

    Zen::Database.handle[:custom_field_groups_sections].insert_multiple(
    [
      {:custom_field_group_id => field_group_id_0, :section_id => section_id_0},
      {:custom_field_group_id => field_group_id_0, :section_id => section_id_1},
      {:custom_field_group_id => field_group_id_1, :section_id => section_id_0},
      {:custom_field_group_id => field_group_id_2, :section_id => section_id_0}
    ])
  end
  
  down do
    [
      :custom_field_groups_sections, :category_groups_sections, :sections, :menu_items,
      :menus, :custom_fields, :custom_field_groups, :categories, :category_groups
    ].each do |table|
      Zen::Database.handle[table].delete
    end
  end

end

# BootstrapFormBuilder

Rails Form Builders for bootstrap style forms.

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrap_form_builder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap_form_builder

## Usage

Currently only supports [horizontal forms](http://getbootstrap.com/css/#forms-horizontal).

To use, pass the builder class into the ``form_for`` method in a Rails form and set the
``form-horizontal`` class on the form element:

```
<%= form_for(resource, 
             :builder => BootstrapFormBuilder::HorizontalFormBuilder,
             :html => { :class => 'form-horizontal' }) do |f| %>
```

Then calling the usual form field methods will generate labels
and form elements confirming to the Bootstrap markup. If there
are errors on the object these will also be output using Bootstrap
[Validation States](http://getbootstrap.com/css/#forms-control-validation).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bootstrap_form_builder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

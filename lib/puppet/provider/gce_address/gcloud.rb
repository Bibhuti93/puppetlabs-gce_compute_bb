require File.expand_path(File.join(File.dirname(__FILE__), '..', 'gcloud'))

Puppet::Type.type(:gce_address).provide(:gcloud, :parent => Puppet::Provider::Gcloud) do
  commands :gcloud => "gcloud"

  def gcloud_resource_name
    'addresses'
  end

  # These arguments are required for both create and destroy
  def gcloud_args
    ['--region', resource[:region]]
  end

  def gcloud_optional_create_args
    {:description => '--description'}
  end
end

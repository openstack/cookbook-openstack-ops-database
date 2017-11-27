# encoding: UTF-8

require_relative 'spec_helper'

describe 'openstack-ops-database::client' do
  describe 'ubuntu' do
    include_context 'database-stubs'
    let(:runner) { ChefSpec::SoloRunner.new(UBUNTU_OPTS) }
    let(:node) { runner.node }
    let(:chef_run) { runner.converge(described_recipe) }

    it 'uses mariadb client recipe by default' do
      node.set['openstack']['db']['service_type'] = 'mariadb'
      expect(chef_run).to include_recipe 'openstack-ops-database::mariadb-client'
    end
  end
end

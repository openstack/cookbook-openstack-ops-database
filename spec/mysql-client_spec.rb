# encoding: UTF-8

require_relative 'spec_helper'

describe 'openstack-ops-database::mysql-client' do
  include_context 'database-stubs'
  describe 'ubuntu' do
    let(:runner) { ChefSpec::SoloRunner.new(UBUNTU_OPTS) }
    let(:node) { runner.node }
    cached(:chef_run) { runner.converge(described_recipe) }

    it 'has default mysql client resource' do
      expect(chef_run).to create_mysql_client 'default'
    end

    it 'has default mysql chef gem resource' do
      expect(chef_run).to install_mysql2_chef_gem('default').with(gem_version: '0.4.5')
    end

    it 'installs mysql packages' do
      expect(chef_run).to install_package 'python3-mysqldb'
      expect(chef_run).to install_package 'libmysqlclient-dev'
    end
  end
end

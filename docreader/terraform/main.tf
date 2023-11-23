module "app" {
  source = "./modules/app"

  name                                         = var.name
  environment                                  = var.environment
  region                                       = var.region
  vpc_network                                  = var.vpc_network
  domain                                       = var.domain
  asg_min_size                                 = var.asg_min_size
  asg_max_size                                 = var.asg_max_size
  asg_desired_capacity                         = var.asg_desired_capacity
  asg_on_demand_base_capacity                  = var.asg_on_demand_base_capacity
  asg_on_demand_percentage_above_base_capacity = var.asg_on_demand_percentage_above_base_capacity
  docreader_instance_type                      = var.docreader_instance_type
  worker_count                                 = var.worker_count
  backlog                                      = var.backlog
  create_schedule                              = var.create_schedule
}

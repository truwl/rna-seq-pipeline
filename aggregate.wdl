version 1.0

task melt {
  input {
      String job_id
      String workflow_instance_identifier
      String workflow_identifier
	  String rep
	  String test
      File qcfile
      File Rscript_aggregate
      String output_prefix
  }
  output {
    File talltable = "~{output_prefix}~{rep}.txt"
  }
  command <<<
    Rscript ~{Rscript_aggregate} ~{job_id} ~{workflow_instance_identifier} ~{workflow_identifier} ~{rep} ~{test} ~{qcfile} ~{output_prefix}~{rep}.txt
  >>>
  runtime {
    docker: "rocker/tidyverse:4.1.0"
    memory: "1 GB"
    cpu: 1
  }
}

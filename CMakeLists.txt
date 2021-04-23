cmake_minimum_required(VERSION 3.3)

project(project)

set(partname "xc7z020clg484-1")
set(boardname "xilinx.com:zc702:part0:1.0")

#cmake_utils file_functions.cmake provides the functions
#add_dependency_tree_file and get_list_from_dependency_tree
include(../../common/vivadoProjGen_functions.cmake)
include(../../common/cmake_functions.cmake)

#we need the full paths to the dependency tree files
get_filename_component(hdldepfile hdl/deptree.txt REALPATH)
get_filename_component(tbdepfile tb/deptree.txt REALPATH)

#full path to constraint file
get_filename_component(xdclistfile constraints/filelist.txt REALPATH)


#placeholder1 and placeholder2 store the filepaths that are the heads of lists
add_dependency_tree_file(placeholder1 ${hdldepfile})
add_dependency_tree_file(placeholder2 ${tbdepfile})

#get list of constraint files
read_filelist(xdcfiles ${xdclistfile})

#the value of topsynth is also in placeholder1
get_filename_component(topsynth hdl/blinky_Top.v REALPATH)
#the value of topsim is also in placeholder2
get_filename_component(topsim tb/blinky_tb.v REALPATH)
get_list_from_dependency_tree(synthfiles ${topsynth})
get_list_from_dependency_tree(simfiles ${topsim})
  


add_vivado_devel_project(
  PRJNAME blinky
  VERILOGSYNTHFILES ${synthfiles}
  VERILOGSIMFILES ${simfiles}
  PARTNAME ${partname}
  UNSCOPEDLATEXDC ${xdcfiles}
  )


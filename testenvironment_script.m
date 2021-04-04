clc;clear all;
simBlockH = get_param(gcb, 'Handle');
% to add input ports
handles_ip = find_system(simBlockH, 'SearchDepth', 1, 'BlockType', 'Inport');
portNames_ip = cellstr(get_param(handles_ip, 'Name'))
[r_ip,c] = size(portNames_ip) 
P_handles_ip = get_param(simBlockH,'PortHandles')
for i=1:r_ip
      ip_p = get_param(P_handles_ip.Inport(i),'Position')
      new_ip_bh = add_block('simulink/Sources/In1',strcat(gcs,'/',portNames_ip{i}),'Position',[ip_p(1)-200 ip_p(2)-8 ip_p(1)-200+35 ip_p(2)-8+16])
      ip_O_bh = get_param(new_ip_bh,'PortHandles') 
      add_line(gcs,ip_O_bh.Outport,P_handles_ip.Inport(i))
end
% to add output ports
handles_op = find_system(simBlockH, 'SearchDepth', 1, 'BlockType', 'Outport');
portNames_op = cellstr(get_param(handles_op, 'Name'))
[r_op,c] = size(portNames_op) 
P_handles_op= get_param(simBlockH,'PortHandles')
for i=1:r_op
      op_p = get_param(P_handles_op.Outport(i),'Position')
      new_op_bh = add_block('simulink/Sinks/Out1',strcat(gcs,'/',portNames_op{i}),'Position',[op_p(1)+200 op_p(2)-8 op_p(1)+200+35 op_p(2)-8+16])
      op_O_bh = get_param(new_op_bh,'PortHandles') 
      add_line(gcs,P_handles_op.Outport(i),op_O_bh.Inport)
end
package js.html;

private typedef RenderDescriptor = {
    var colorAttachments:Dynamic;
};

extern class GpuCommandEncoder {
    public function beginRenderPass(descriptor:RenderDescriptor):GpuRenderPassEncoder;
    public function finish():GpuCommandBuffer;
}

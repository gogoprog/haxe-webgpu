package js.html;


extern class GpuRenderPassEncoder {
    public function setPipeline(pipeline:GpuRenderPipeline):Void;
    public function draw(vertexCount:Int, instanceCount:Int, firstVertex:Int, firstInstance:Int):Void;
    public function end():Void;
}

package js.html;

extern class Gpu {
    public function getPreferredCanvasFormat():String;
    public function requestAdapter():js.lib.Promise<js.html.GpuAdapter>;
}


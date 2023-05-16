package js.html;

extern class GpuAdapter {
    public function requestDevice():js.lib.Promise<js.html.GpuDevice>;
}

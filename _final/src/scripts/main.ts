import {cams} from './gl';
import '../styles/index.scss';

const canvas = <HTMLCanvasElement>document.getElementById("glCanvas");

let pr = new cams(canvas);

pr.init();


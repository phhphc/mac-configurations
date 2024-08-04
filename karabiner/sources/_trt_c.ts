import { data } from "./_trt_dat";

const chartData = data.datatables[0].data;

const timeGroups = new Map<number, Map<string, number>>();

chartData.forEach((d) => {
  const source = d["MiniAppSrcSegmentAppId.source"];
  const time = d["time"];
  const total = d["MiniAppSrcSegmentAppId.TotalA1"];

  let group = timeGroups.get(time);
  if (!group) {
    group = new Map<string, number>();
    timeGroups.set(time, group);
  }
  group.set(source, total);
});

console.log(timeGroups);

timeGroups.forEach((f, v) => {
  const all = f.get("All");
  let sum = 0;
  f.forEach((v, k) => {
    sum += k === "All" ? 0 : v;
  });

  console.log(all, sum, v);
});

import * as fs from "fs/promises";

const _inputs: Record<string, string | undefined> = {};

export async function getInput(day: string): Promise<string> {
  const cachedInputs = _inputs[day];
  if (cachedInputs != null) return cachedInputs;

  const input = await fs.readFile(`inputs/${day}.txt`, "utf-8");
  const inputString = input.toString();
  _inputs[day] = inputString;

  return inputString;
}
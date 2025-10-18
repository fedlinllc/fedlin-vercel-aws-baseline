export const handler = async () => ({
  statusCode: 200,
  headers: { "content-type": "application/json" },
  body: JSON.stringify({ ok: true, service: "fedlin-api", ts: new Date().toISOString() })
});

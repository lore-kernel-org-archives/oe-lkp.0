Content-Type: multipart/mixed; boundary="===============1795589441799262983=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [smp] a32a4d8a81: netperf.Throughput_tps -2.1% regression
Date: Wed, 19 May 2021 19:31:16 +0000
Message-ID: <CDFF26F9-A748-403C-86B2-4511DD6B1833@vmware.com>
In-Reply-To: <20210519183839.GH21560@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1795589441799262983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On May 19, 2021, at 11:38 AM, Peter Zijlstra <peterz@infradead.org> wro=
te:
> =

> On Wed, May 19, 2021 at 06:17:35PM +0000, Nadav Amit wrote:
>>>     1287 =C2=B1 42%     +75.3%       2256 =C2=B1 14%  interrupts.CPU111=
.CAL:Function_call_interrupts
>>>     1326 =C2=B1 43%     +71.0%       2267 =C2=B1 13%  interrupts.CPU119=
.CAL:Function_call_interrupts
>>>     1300 =C2=B1 45%     +75.9%       2287 =C2=B1 37%  interrupts.CPU120=
.CAL:Function_call_interrupts
>>>     1299 =C2=B1 45%     +60.1%       2081 =C2=B1 28%  interrupts.CPU128=
.CAL:Function_call_interrupts
>>>     1305 =C2=B1 45%     +61.7%       2110 =C2=B1 29%  interrupts.CPU131=
.CAL:Function_call_interrupts
>>>     1299 =C2=B1 45%     +61.8%       2102 =C2=B1 28%  interrupts.CPU139=
.CAL:Function_call_interrupts
>>>    66.67 =C2=B1133%     -97.2%       1.83 =C2=B1155%  interrupts.CPU14.=
TLB:TLB_shootdowns
>>>     1299 =C2=B1 45%    +107.8%       2700 =C2=B1 33%  interrupts.CPU142=
.CAL:Function_call_interrupts
>>>   301.83 =C2=B1128%     -95.6%      13.17 =C2=B1140%  interrupts.CPU149=
.RES:Rescheduling_interrupts
>>>   389.17 =C2=B1 89%     -73.5%     103.17 =C2=B1 35%  interrupts.CPU164=
.NMI:Non-maskable_interrupts
>>>   389.17 =C2=B1 89%     -73.5%     103.17 =C2=B1 35%  interrupts.CPU164=
.PMI:Performance_monitoring_interrupts
>>>     1299 =C2=B1 45%     +60.2%       2081 =C2=B1 28%  interrupts.CPU35.=
CAL:Function_call_interrupts
>>>     1244 =C2=B1 50%     +66.8%       2076 =C2=B1 27%  interrupts.CPU45.=
CAL:Function_call_interrupts
>>>     1300 =C2=B1 44%     +59.5%       2075 =C2=B1 28%  interrupts.CPU46.=
CAL:Function_call_interrupts
>>>     1.50 =C2=B1 63%   +1422.2%      22.83 =C2=B1167%  interrupts.CPU47.=
RES:Rescheduling_interrupts
>>>   467.33 =C2=B1 85%     -64.6%     165.67 =C2=B1 74%  interrupts.CPU58.=
NMI:Non-maskable_interrupts
>>>   467.33 =C2=B1 85%     -64.6%     165.67 =C2=B1 74%  interrupts.CPU58.=
PMI:Performance_monitoring_interrupts
>>>   306.67 =C2=B1 75%     -59.9%     122.83 =C2=B1 16%  interrupts.CPU68.=
NMI:Non-maskable_interrupts
>>>   306.67 =C2=B1 75%     -59.9%     122.83 =C2=B1 16%  interrupts.CPU68.=
PMI:Performance_monitoring_interrupts
>>>     1131 =C2=B1 27%     +61.2%       1822 =C2=B1 35%  interrupts.CPU85.=
CAL:Function_call_interrupts
>>>     1180 =C2=B1 31%     +79.6%       2119 =C2=B1 24%  interrupts.CPU86.=
CAL:Function_call_interrupts
>>> =

> =

> It looks to be sending *waay* more call IPIs, did we mess up the mask or
> loose an optimization somewhere?
> =

> I'll go read the commit again=E2=80=A6

As you know, I did mess up by calling arch_send_call_function_single_ipi()
instead of smp_call_function_single(), which could explain the extra IPIs.
But that was resolved by your subsequent patch.

For me, what stands out is the time in C1 spent after the patch.

I will try to reproduce the issue to figure it out, since so far I could
not find an error in the code.


--===============1795589441799262983==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVTSkwzb3NsNVlt
eC93OUkxSGFBcVNhYmFEMW9GQW1DbFo0TUFDZ2tRSGFBcVNhYmEKRDFxK3FRLzVBU1VuWkdGMlBp
eTVmMStVTEFhMTlXdEJGV2dmNWpMNDM0YTFmaCt6LzZLTHBYajRIRk1MckNhTgoraTFHS1Q4a0Nm
R2w3VWNJSlMzeGhkOHMwQTFGNTM5MEJKL1NJRVNTTTdNZTY0bzY3U3pzVW9oMDU3aUM2NkIvCllr
ZVRBcmdtUEdqejlNQUFSeHhvWFJOUGRNd3g5ZGdEZnQ1TmdTNVU4WDJRZTFjK1J6TEtMWEd3bk5R
QjZ3YUwKSDMwbkZtV0JkVERWTHhweTRGdk9EczhUSUs1a3l3Q1c5YS9rYjZycTZLSERGeW5CbkpW
ZlI4SVpJRnBITXhRNApuSm1TTVZacWNZd2tMUVpMRldNUzh5eHVsL0QzcEdLeVc1bkdkSkZOYlNB
bnFpa2hDdFVQYXR1UjNOQkNjUEJJClZVekIxWHFQY2JQTUcvWDQyUENwc1dTRFlnMmk1bXNiZDVm
NStNYlo0YjBTMnowUnY0RjF5U3NXZCtMcFcvU2kKSzdFVDBNbnRzdXd1ZnRRMml0UE5KS292bld1
OHluWHk4OWVpdzFTWWl1UzdubW5xT3JDMjNQK0kwbnlEa3RTZwpRaFV0MmdKajBWZ2lGYzl4a0NS
UzA2djBIMmlPK0R0Ri8vWVQ0SHN6TUZKeHc4UzRjcWRBMDU5SXh0ZGtIMm55ClJtUjN4cXFsY2dn
Z1hYWmg0ckZQTW9pSkplN294WGlGN3poWVdFUnhXelFMNGFrNFVEQ2tIb3JqVTAyYXg0R0wKT3ow
SjBNamcyQWVJa0ZydHQrYUJoL2I1cWI4bEdSREE4T0pBS3hjYVhyOUY5eVludjNWTzh6WEc0UklX
ZE5CbQpiTFRYVDJ3VFJNRmE4Q0tOZVZzQkErQ0hXUE1sNm9INnRPUzBxV0dKWnJrem5DVEREaDA9
Cj14WFFCCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1795589441799262983==--


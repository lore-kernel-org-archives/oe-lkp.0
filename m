Content-Type: multipart/mixed; boundary="===============8356654761616428193=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [smp] a32a4d8a81: netperf.Throughput_tps -2.1% regression
Date: Wed, 19 May 2021 20:38:39 +0200
Message-ID: <20210519183839.GH21560@worktop.programming.kicks-ass.net>
In-Reply-To: <16A4D949-D82D-4034-B5A4-DE4DADE15884@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8356654761616428193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 06:17:35PM +0000, Nadav Amit wrote:
> >      1287 =C2=B1 42%     +75.3%       2256 =C2=B1 14%  interrupts.CPU11=
1.CAL:Function_call_interrupts
> >      1326 =C2=B1 43%     +71.0%       2267 =C2=B1 13%  interrupts.CPU11=
9.CAL:Function_call_interrupts
> >      1300 =C2=B1 45%     +75.9%       2287 =C2=B1 37%  interrupts.CPU12=
0.CAL:Function_call_interrupts
> >      1299 =C2=B1 45%     +60.1%       2081 =C2=B1 28%  interrupts.CPU12=
8.CAL:Function_call_interrupts
> >      1305 =C2=B1 45%     +61.7%       2110 =C2=B1 29%  interrupts.CPU13=
1.CAL:Function_call_interrupts
> >      1299 =C2=B1 45%     +61.8%       2102 =C2=B1 28%  interrupts.CPU13=
9.CAL:Function_call_interrupts
> >     66.67 =C2=B1133%     -97.2%       1.83 =C2=B1155%  interrupts.CPU14=
.TLB:TLB_shootdowns
> >      1299 =C2=B1 45%    +107.8%       2700 =C2=B1 33%  interrupts.CPU14=
2.CAL:Function_call_interrupts
> >    301.83 =C2=B1128%     -95.6%      13.17 =C2=B1140%  interrupts.CPU14=
9.RES:Rescheduling_interrupts
> >    389.17 =C2=B1 89%     -73.5%     103.17 =C2=B1 35%  interrupts.CPU16=
4.NMI:Non-maskable_interrupts
> >    389.17 =C2=B1 89%     -73.5%     103.17 =C2=B1 35%  interrupts.CPU16=
4.PMI:Performance_monitoring_interrupts
> >      1299 =C2=B1 45%     +60.2%       2081 =C2=B1 28%  interrupts.CPU35=
.CAL:Function_call_interrupts
> >      1244 =C2=B1 50%     +66.8%       2076 =C2=B1 27%  interrupts.CPU45=
.CAL:Function_call_interrupts
> >      1300 =C2=B1 44%     +59.5%       2075 =C2=B1 28%  interrupts.CPU46=
.CAL:Function_call_interrupts
> >      1.50 =C2=B1 63%   +1422.2%      22.83 =C2=B1167%  interrupts.CPU47=
.RES:Rescheduling_interrupts
> >    467.33 =C2=B1 85%     -64.6%     165.67 =C2=B1 74%  interrupts.CPU58=
.NMI:Non-maskable_interrupts
> >    467.33 =C2=B1 85%     -64.6%     165.67 =C2=B1 74%  interrupts.CPU58=
.PMI:Performance_monitoring_interrupts
> >    306.67 =C2=B1 75%     -59.9%     122.83 =C2=B1 16%  interrupts.CPU68=
.NMI:Non-maskable_interrupts
> >    306.67 =C2=B1 75%     -59.9%     122.83 =C2=B1 16%  interrupts.CPU68=
.PMI:Performance_monitoring_interrupts
> >      1131 =C2=B1 27%     +61.2%       1822 =C2=B1 35%  interrupts.CPU85=
.CAL:Function_call_interrupts
> >      1180 =C2=B1 31%     +79.6%       2119 =C2=B1 24%  interrupts.CPU86=
.CAL:Function_call_interrupts
> > =


It looks to be sending *waay* more call IPIs, did we mess up the mask or
loose an optimization somewhere?

I'll go read the commit again...
--===============8356654761616428193==--


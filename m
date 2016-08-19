Content-Type: multipart/mixed; boundary="===============4524766300145191143=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Fri, 19 Aug 2016 15:24:20 +0800
Message-ID: <20160819072420.GA1167@aaronlu.sh.intel.com>
In-Reply-To: <ad074d65-52bd-7b6f-f0c3-b94abf288c9a@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4524766300145191143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2016 at 04:19:39AM -0300, Marcelo Ricardo Leitner wrote:
> Hi,
> =

> Em 19-08-2016 02:29, Aaron Lu escreveu:
> ...
> > It doesn't look insane and sctp_wait_for_sndbuf may actually have
> > something to do with a larger sctp_chunk I suppose?
> > =

> > The same perf record doesn't capture any sample for the good commit,
> > which suggests the nerperf process doesn't sleep in sctp_wait_for_sndbu=
f.
> =

> Ahhh yes! It does, and then it would mean your txbuf is too small for the
> chunk sizes you're using (sctp tests option -m).
> =

> What's your netperf cmdline again please?

netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1

Is the 10K used here a problem? If so, can you suggest a proper value
for our netperf performance test? Thanks.

Regards,
Aaron

--===============4524766300145191143==--


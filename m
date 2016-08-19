Content-Type: multipart/mixed; boundary="===============2935564447529619885=="
MIME-Version: 1.0
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Fri, 19 Aug 2016 04:19:39 -0300
Message-ID: <ad074d65-52bd-7b6f-f0c3-b94abf288c9a@gmail.com>
In-Reply-To: <20160819052941.GA1179@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2935564447529619885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Em 19-08-2016 02:29, Aaron Lu escreveu:
...
> It doesn't look insane and sctp_wait_for_sndbuf may actually have
> something to do with a larger sctp_chunk I suppose?
>
> The same perf record doesn't capture any sample for the good commit,
> which suggests the nerperf process doesn't sleep in sctp_wait_for_sndbuf.

Ahhh yes! It does, and then it would mean your txbuf is too small for =

the chunk sizes you're using (sctp tests option -m).

What's your netperf cmdline again please?

Regards,
Marcelo

--===============2935564447529619885==--


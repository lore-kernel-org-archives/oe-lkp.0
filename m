Content-Type: multipart/mixed; boundary="===============2446891051493840690=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 16:58:59 +0800
Message-ID: <CADvbK_dqSTArYJQGD9--vi4vyV-kfAg50=cK4oc7AhGzSwbLXQ@mail.gmail.com>
In-Reply-To: <20160817084832.GA5342@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2446891051493840690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
> It doesn't change on my desktop Sandybridge.
>
> $ cat 4.7.0-rc6-01199-g116558d316e8/0/netperf.json
> {
>   "netperf.Throughput_Mbps": [
>    748.2056249999998
>   ]
> }
>
> Where commit 116558d316e8 is based on top of the last test commit
> 98dd2532b14e with the sent_count removed.
Nice job
I guess it may be because of your system memory limitation

sctp_chunk size is bigger than before, netpref produced a lot
of sctp_chunk in send queue.

can you check the memory of your systems when the test is
running,  to see if memory is the bottle neck of this test ?

>
> Thanks,
> Aaron

--===============2446891051493840690==--


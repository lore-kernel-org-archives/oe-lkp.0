Content-Type: multipart/mixed; boundary="===============2820315233023306946=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [blk-lib] 6a0608544e5: fileio -77.4% max latency, -5.7% throughput
Date: Wed, 05 Mar 2014 12:23:53 +1100
Message-ID: <20140305012352.GR13647@dastard>
In-Reply-To: <20140305011645.GA7433@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2820315233023306946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2014 at 09:16:45AM +0800, Fengguang Wu wrote:
> On Tue, Mar 04, 2014 at 01:52:25PM -0800, Kent Overstreet wrote:
> > On Tue, Mar 04, 2014 at 09:21:30PM +0800, Fengguang Wu wrote:
> > > Hi Kent,
> > > =

> > > FYI, we noticed the below changes on
> > > =

> > > git://evilpiepirate.org/~kent/linux-bcache.git for-jens
> > > commit 6a0608544e5672bd9a044c285119547eae41abe5 ("blk-lib.c: generic_=
make_request() handles large bios now")
> > > =

> > > test case: snb-drag/sysbench/fileio/600s-100%-1HDD-ext4-64G-1024-seqr=
ewr-sync
> =

> snb-drag is the test machine, it's a SNB desktop.
> =

> The test command is
> =

>         mkfs -t ext4 -q /dev/sda2
>         mount -t ext4 /dev/sda2 /fs/sda2
>         cd /fs/sda2
> =

>         for i in $(seq 0 1023)
>         do
>                 fallocate -l 67108864 test_file.$i
>         done
> =

>         sysbench --test=3Dfileio --max-requests=3D0 --num-threads=3D4 --m=
ax-time=3D600 --file-test-mode=3Dseqrewr --file-total-size=3D68719476736 --=
file-io-mode=3Dsync --file-num=3D1024 run
> =

> =

> > I'm trying to figure out how to parse this and the graphs - where do I =
find the
> > test? And is there anything you can point me to for the graphs, or is t=
hat
> > output from that test?
> > =

> > > =

> > > 11541d5f5b7002b  6a0608544e5672bd9a044c285  =

> > > ---------------  -------------------------  =

> > >       1885 ~60%     -77.4%        426 ~ 7%  TOTAL fileio.request_late=
ncy_max_ms
> =

> The ~XX% numbers are stddev percent.
> The [+-]XX% is change percent.

Can you put this in as column headers so that people don't have to
this every time they see a report from you?

> The below graph shows all samples collected during the bisect
> =

> [*] bisect-good =

> [O] bisect-bad
> =

> In which you can see the stableness of the change and bisect. =


Oh, so that's what the graphs contain. :/

Again - perhaps you should include this information with the graphs
rather than just dumping unlabelled data on people ;)

Cheers,

Dave.

-- =

Dave Chinner
david(a)fromorbit.com

--===============2820315233023306946==--


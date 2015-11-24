Content-Type: multipart/mixed; boundary="===============1181772170421299449=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [direct] e594571852: xfstests.generic.299.fail
Date: Tue, 24 Nov 2015 11:03:41 +0100
Message-ID: <20151124100341.GC25232@quack.suse.cz>
In-Reply-To: <87r3jguhrx.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1181772170421299449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 24-11-15 12:45:54, Huang, Ying wrote:
> Jan Kara <jack@suse.cz> writes:
> =

> >   Hello,
> >
> > On Mon 23-11-15 16:29:25, kernel test robot wrote:
> >> FYI, we noticed the below changes on
> >> =

> >> git://internal_merge_and_test_tree
> >> revert-e594571852b03a5503ba48edd718462e99bf238e-e594571852b03a5503ba48=
edd718462e99bf238e
> >> commit e594571852b03a5503ba48edd718462e99bf238e ("direct-io: Fix negat=
ive return from dio read beyond eof")
> >
> > Do you have the file:
> >
> > /lkp/benchmarks/xfstests/results//generic/299.full
> >
> > produced by the failed test? Thanks!
> =

> I found we have this feature in our test scripts already, just need to
> fix a bug in script, but that is just done yesterday!  Please check the
> 299.full attached.

Thanks for the file. The cause of failure is ENOMEM error aio-dio-verifier
got - so it is very likely unrelated to my patch:

fio: io_u.c:1315: __get_io_u: Assertion `io_u->flags & IO_U_F_FREE' failed.
fio: pid=3D607, got signal=3D6
fio: io_u error on file /fs/scratch/aio-dio-verifier: Cannot allocate memory
     read offset=3D8446353408, buflen=3D4096
fio: io_u error on file /fs/scratch/aio-dio-verifier: Cannot allocate memory
     read offset=3D71839776768, buflen=3D4096
aio-dio-verifier: (groupid=3D0, jobs=3D1): err=3D12 (file:io_u.c:1548, func=
=3Dio_u
  error, error=3DCannot allocate memory): pid=3D605: Tue Nov 24 11:18:39 20=
15
  cpu          : usr=3D0.00%, sys=3D0.10%, ctx=3D42, majf=3D0, minf=3D14
  IO depths    : 1=3D0.8%, 2=3D1.6%, 4=3D3.1%, 8=3D6.2%, 16=3D12.5%, 32=3D2=
5.0%, >=3D64=3D50.8%
     submit    : 0=3D0.0%, 4=3D100.0%, 8=3D0.0%, 16=3D0.0%, 32=3D0.0%, 64=
=3D0.0%, >=3D64=3D0.0%
     complete  : 0=3D0.0%, 4=3D100.0%, 8=3D0.0%, 16=3D0.0%, 32=3D0.0%, 64=
=3D0.0%, >=3D64=3D0.0%
     issued    : total=3Dr=3D64/w=3D64/d=3D0, short=3Dr=3D0/w=3D0/d=3D0
     errors    : total=3D0, first_error=3D0/<Success>
     latency   : target=3D0, window=3D0, percentile=3D100.00%, depth=3D128

If you have time, you can check why ENOMEM actually happens in your test
setup...

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============1181772170421299449==--


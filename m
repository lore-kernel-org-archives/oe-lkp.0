Content-Type: multipart/mixed; boundary="===============1405638768412429091=="
MIME-Version: 1.0
From: Jeff Moyer <jmoyer@redhat.com>
To: lkp@lists.01.org
Subject: Re: [block] 34b48db66e0: +3291.6% iostat.sde.wrqm/s
Date: Thu, 22 Jan 2015 15:49:49 -0500
Message-ID: <x49fvb28rrm.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <54C1494D.5050507@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1405638768412429091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jens Axboe <axboe@fb.com> writes:

>> Agreed on all above, but are the actual benchmark numbers included
>> somewhere in all this mess?  I'd like to see if the benchmark numbers
>> improved first, before digging into the guts of which functions are
>> called more or which stats changed.
>
> I deleted the original email, but the latter tables had drive throughput
> rates and it looked higher for the ones I checked on the newer kernel.
> Which the above math would indicate as well, multiplying reqs-per-sec
> and req-size.

Looking back at the original[1], I think I see the throughput numbers for
iozone.  The part that confused me was that each table mixes different
types of data.  I'd much prefer if different data were put in different
tables, along with column headers that stated what was being reported
and the units for the measurements.

Anyway, I find the increased service time troubling, especially this
one:

testbox/testcase/testparams: ivb44/fsmark/performance-1x-1t-1HDD-xfs-4M-60G=
-NoSync

       544 ?  0%   +1268.9%       7460 ?  0%  iostat.sda.w_await
       544 ?  0%   +1268.5%       7457 ?  0%  iostat.sda.await

I'll add this to my queue of things to look into.

Cheers,
Jeff

[1] https://lkml.org/lkml/2015/1/21/846

--===============1405638768412429091==--


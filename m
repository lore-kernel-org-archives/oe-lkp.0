Content-Type: multipart/mixed; boundary="===============6905388361285399768=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] ec795418c4: fsmark.files_per_sec -36.3% regression
Date: Tue, 30 Aug 2016 09:44:18 -0700
Message-ID: <87pooqnr4t.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160830023048.GA2088@jaegeuk>
List-Id: <oe-lkp.lists.linux.dev>

--===============6905388361285399768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jaegeuk Kim <jaegeuk@kernel.org> writes:

> Hello,
>
> On Sat, Aug 27, 2016 at 10:13:34AM +0800, Fengguang Wu wrote:
>> Hi Jaegeuk,
>> =

>> > > >> > - [lkp] [f2fs] b93f771286: aim7.jobs-per-min -81.2% regression
>> > > >> >
>> > > >> > The disk is 4 12G ram disk, and setup RAID0 on them via mdadm. =
 The
>> > > >> > steps for aim7 is,
>> > > >> >
>> > > >> > cat > workfile <<EOF
>> > > >> > FILESIZE: 1M
>> > > >> > POOLSIZE: 10M
>> > > >> > 10 sync_disk_rw
>> > > >> > EOF
>> > > >> >
>> > > >> > (
>> > > >> >     echo $HOSTNAME
>> > > >> >     echo sync_disk_rw
>> > > >> >
>> > > >> >     echo 1
>> > > >> >     echo 600
>> > > >> >     echo 2
>> > > >> >     echo 600
>> > > >> >     echo 1
>> > > >> > ) | ./multitask -t &
>> > > >>
>> > > >> Any update on these 2 regressions?  Is the information is enough =
for you
>> > > >> to reproduce?
>> > > >
>> > > > Sorry, I've had no time to dig this due to business travel now.
>> > > > I'll check that when back to US.
>> > > =

>> > > Any update?
>> > =

>> > Sorry, how can I get multitask binary?
>> =

>> It's part of aim7, which can be downloaded here:
>> =

>> http://nchc.dl.sourceforge.net/project/aimbench/aim-suite7/Initial%20rel=
ease/s7110.tar.Z
>
> Thank you for the codes.
>
> I've run this workload on the latest f2fs and compared performance having
> without the reported patch. (1TB nvme SSD, 16 cores, 16GB DRAM)
> Interestingly, I could find slight performance improvement rather than
> regression. :(
> Not sure how to reproduce this.

I think the difference lies on disk used.  The ramdisk is used in the
original test, but it appears that your memory is too small to setup the
RAM disk for test.  So it may be impossible for you to reproduce the
test unless you can find more memory :)

But we can help you to root cause the issue.  What additional data do
you want?  perf-profile data before and after the patch?

Best Regards,
Huang, Ying

--===============6905388361285399768==--


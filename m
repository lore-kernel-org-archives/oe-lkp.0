Content-Type: multipart/mixed; boundary="===============4882473329893475386=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Fri, 21 May 2021 11:27:30 +0200
Message-ID: <20210521092730.GE18952@quack2.suse.cz>
In-Reply-To: <e9f776c4-1ade-42a6-54c4-7fe3442e2392@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4882473329893475386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 21-05-21 09:16:42, Xing Zhengjun wrote:
> Hi Jan,
> =

> On 5/20/2021 5:51 PM, Jan Kara wrote:
> > Hello!
> > =

> > On Thu 20-05-21 15:13:20, Xing Zhengjun wrote:
> > > =

> > >  =C2=A0=C2=A0=C2=A0=C2=A0 Do you have time to look at this? The regre=
ssion still existed in the
> > > latest Linux mainline v5.13-rc2.
> > =

> > Thanks for verification and for the ping! I had a look into this and I
> > think the regression is caused by the changes in orphan handling. The l=
oad
> > runs multiple tasks all creating and deleting files. This generally
> > contends on the orphan locking with fast storage (which is your case
> > because you use ramdisk as a backing store AFAICT). And the changes I d=
id
> > move superblock checksum computation under the orphan lock so the lock =
hold
> > times are now higher.
> > =

> > Sadly it is not easy to move checksum update from under the orphan lock=
 and
> > maintain checksum consistency since the checksum has to be recomputed
> > consistently with the changes of superblock state. But I have one idea =
how
> > we could maybe improve the situation. Can you check whether attached pa=
tch
> > recovers the regression? Because that's about how good it could get whe=
n we
> > are more careful when writing out superblock.
> > =

> > 								Honza
> > =

> =

> I apply the patch based on v5.13-rc2 and test, it can not recover the
> regression and the regression became more serious(-45.7%).

OK, thanks for testing. So the orphan code is indeed the likely cause of
this regression but I probably did not guess correctly what is the
contention point there. Then I guess I need to reproduce and do more
digging why the contention happens...

								Honza

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/disk/md/fs/test/load/cpufreq_=
governor/ucode:
> =

> lkp-csl-2sp9/aim7/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/4=
BRD_12G/RAID1/ext4/creat-clo/1000/performance/0x5003006
> =

> commit:
>   4392fbc4bab57db3760f0fb61258cb7089b37665
>   05c2c00f3769abb9e323fcaca70d2de0b48af7ba
>   v5.13-rc2
>   2a1eb1a2fc08daaaf76a5aa8ffa355b5a5013d86    (the test patch)
> =

> 4392fbc4bab57db3 05c2c00f3769abb9e323fcaca70                   v5.13-rc2
> 2a1eb1a2fc08daaaf76a5aa8ffa
> ---------------- --------------------------- ---------------------------
> ---------------------------
>          %stddev     %change         %stddev     %change %stddev     %cha=
nge
> %stddev
>              \          |                \          |                \
> |                \
>      13342           -11.8%      11771 =C2=B1  2%     -14.2%      11450
> -45.7%       7240 =C2=B1  3%  aim7.jobs-per-min
> =

> =

> =

> -- =

> Zhengjun Xing
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============4882473329893475386==--


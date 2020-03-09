Content-Type: multipart/mixed; boundary="===============0629438660393517051=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Mon, 09 Mar 2020 16:26:49 +0800
Message-ID: <20200309082649.GT5972@shao2-debian>
In-Reply-To: <87h7yy90ve.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0629438660393517051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2020 at 07:07:17PM +0100, Thomas Gleixner wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> =

> > [ Just a re-send without html crud that makes all the lists unhappy.
> > I'm still on the road, the flight I was supposed to be on yesterday
> > got cancelled.. ]
> >
> > I do note that the futex hashing seems to be broken by that commit. Or
> > at least it's questionable.  It keeps hashing on "both.word",  and
> > doesn't use the u64 field at all for hashing.
> >
> > Maybe I'm mis-reading it - I didn't apply the patch, I just looked at
> > the patch and my source base separately.
> >
> > But the 98% regression sure says something went wrong ;)
> =

> Right you are. The pointer needs to be the starting point as it moved
> ahead of word, which means it starts at word and hashes word and
> offset and an extra u32 beyond the end of the key.
> =

> Thanks,
> =

>         tglx
> ----
> diff --git a/kernel/futex.c b/kernel/futex.c
> index e14f7cd45dbd..9f3251349f65 100644
> --- a/kernel/futex.c
> +++ b/kernel/futex.c
> @@ -385,8 +385,8 @@ static inline int hb_waiters_pending(struct futex_has=
h_bucket *hb)
>   */
>  static struct futex_hash_bucket *hash_futex(union futex_key *key)
>  {
> -	u32 hash =3D jhash2((u32*)&key->both.word,
> -			  (sizeof(key->both.word)+sizeof(key->both.ptr))/4,
> +	u32 hash =3D jhash2((u32*)&key->both.ptr,
> +			  (sizeof(key->both.ptr) + sizeof(key->both.word)) / 4,
>  			  key->both.offset);
>  	return &futex_queues[hash & (futex_hashsize - 1)];
>  }

Hi Thomas,

I have tested the above patch, and the patch can fix the regression.

commit:
  v5.6-rc4
  8019ad13ef ("futex: Fix inode life-time issue")
  8eb641cbc3 ("the fix patch")

        v5.6-rc4  8019ad13ef7f64be44d4f892af  8eb641cbc397e3bbea2a9974e0  t=
estcase/testparams/testbox
----------------  --------------------------  --------------------------  -=
--------------------------
         %stddev      change         %stddev      change         %stddev
             \          |                \          |                \  =

   1083510             -98%      23904                     1078868        w=
ill-it-scale/performance-process-100%-futex2-ucode=3D0x2000065/lkp-skl-fpga=
01
   1083510             -98%      23904                     1078868        G=
EO-MEAN will-it-scale.per_process_ops

Best Regards,
Rong Chen
--===============0629438660393517051==--


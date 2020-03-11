Content-Type: multipart/mixed; boundary="===============2898254615109202021=="
MIME-Version: 1.0
From: Thierry Reding <thierry.reding@gmail.com>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Wed, 11 Mar 2020 09:20:00 +0100
Message-ID: <20200311082000.GA724@ulmo>
In-Reply-To: <87h7yy90ve.fsf@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2898254615109202021==
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

I was running into an issue with sshfs mounts and git bisect pointed to
the "futex: Fix inode life-time issue" commit as being the culprit. The
issue I was seeing is that an sshfs mount would succeed, but trying to
then access the mount ("ls -l /mnt" would be enough) would cause a soft
lock-up.

Applying this fix on top of next-20200310 fixes the issue for me, so:

Tested-by: Thierry Reding <treding@nvidia.com>

I still need that fix on next-20200311, but it'll probably show up in
linux-next sometime soon.

Thierry

--===============2898254615109202021==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZpRUVpT3JEQ0FGSnpQ
ZkFqY2lmM1NPczEzOCtzNkVGQWw1b255d0FDZ2tRM1NPczEzOCsKczZFOTh4QUFqQjVVbTE5N0U5
SkZ5aFp0UzZNRFF0WlBaZ3JGY2Fhc2F2aFVQdzloMTlobEVEaS9hZjlvR3JMTQpoSmQwS3Z5bWt3
L2NrWm1wTUdDamkrKzhyTkE4RFUxYlBybUxyNVFJRlM0aUNESlFWVFd5eG5kcUZtdVAwYWlGClps
VDhyaThteTV5NWtmWHRiZjAvQ1NNTVV0MGExU1RIVksrUVc1ZkZSNXpVK29XSlNReWE2U1pXclF2
MHFZN1QKbGZkYjJNS0E4Uml1cjJFWWpaSDlEZHR0OTdBd0xVNnpZVW8yNjc5RVR5c1lYemdROFIr
QXhYNGZZaUMrWjBjWgp2aXNYeHhoNkJLMk9MaGgrRFMyUnplYXhjNStiUTRmcHpBUFM5Q0NFdGNE
WjNISGhOSDZRbVUzUWs0VWtyRVYyCktDaGFSdytEUUJWZ21UVFhPbllNVURXaTczZGRMZFk3b0lj
OEZZMUNEcDhZSkluTzdFRk9MelBJQjhUekxiL3YKYUdQbVVYOGxYRlB2aHVJeXUzVDNQNVJrL0VI
N2hoY1NQZ00wMWV3QVEyWE9OcThKL000VlRCU3g2aWpRaUl2Ugo2NUk5cXdhRHNVTGVRa1czeXVj
MkJZMDMrM3dPM2xNWjRmSkRIK2NMV2NzQnZyczJiZEZDVSt1a1Y2Rk0wcldvCktRSDZVQzdOSytW
TUhQSVhheHF0VEo5ZkJ1VVBtNVdDeE45eDlpMUIwK0Z0NUloYlZRVGdDYXp5R05sTFpvUGsKMFhW
Tk9PcitJeHo2czloeGJLTXd3MjNPWlk2WWZMRCt2cGxKMlVoNlBVeWh0bzNOUENFWFZlVjRzZ0F2
aGxCVwpZakp0OFZJWUxwbmpTYzJKbnRYLzlFVWJ2c0R6ZnVLazV0ZUpLZHJpcGV1UXlvZGhXUXM9
Cj0zekplCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============2898254615109202021==--


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076021A0B
	for <oe-lkp@lists.linux.dev>; Sun, 14 Jul 2024 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720958499; cv=none; b=qW/aPcYXa3spHGl0kWzeIZT5oWIGeTMlY1PsYfqpMC3Ah9GmmENvdbMhxVkQxeaVcOUV91+497KZmPL49sLKaNuFONH/CoF73HosnZP6y+QGjyaW7Li0f5je+1fo0WVTsACW2/MJUuVCKi7YSzyCQo72Ct01xOjkOAJvcTFefsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720958499; c=relaxed/simple;
	bh=BN/FYWY0nJnO0paeK6Nn0xFxhyMUisApgAksNZnmuVU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pOsLA81xFZ5jagNQShVfr+P1YKuwpn3mP4l0H3Y1+7btI/G4ijKk7x3WSz+U5nYG7yVDrPMagsV2FZ3MEVFmrnSyGY+mQuaYz/PCu2OKkhDcWLbdT6IaZVbTC3RsyTdN2VCbFj39sXT7hgUKikK9r18P2y5Ct3sdwc+NWxXu9Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vh8YFx1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vh8YFx1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A210AC116B1;
	Sun, 14 Jul 2024 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720958499;
	bh=BN/FYWY0nJnO0paeK6Nn0xFxhyMUisApgAksNZnmuVU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vh8YFx1GJ9Quhp2jmT4xfTAOysBULWAqSaTjUErnvWoiyc6xsErUiq0+iKp4FEkMn
	 mINGvvXsy5FZCVK/uctiOTWNVvRRN3ntR5D11TKqRWZFHB7sLXwDubmoYUB9XrFkEO
	 s3cfnVPdDHaI/PKFbaCec24Mg4DvOmOOZyYQyaIonYRbrOTQsyd94JtVZmxLgOGlIu
	 YbVhEvY4RAsosKhIYUTAADhs1c6fju8W4PPp7bxNEHYjxrRNp1aGfUy49N+QHBpgNj
	 kC0dIL4ZsDFE4rzI5DlHUcbj6CI7Zf9nrIfhuhuyUPhm6iahMB//9VgLayrDU8Gd7j
	 HqDyqlnK9w3FA==
Message-ID: <36685366de25fffa8a817ba5766eead2f4f791f9.camel@kernel.org>
Subject: Re: [jlayton:mgtime] [tmpfs]  6602c8010f:
 BUG:unable_to_handle_page_fault_for_address
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org
Date: Sun, 14 Jul 2024 08:01:37 -0400
In-Reply-To: <202407141802.19588609-lkp@intel.com>
References: <202407141802.19588609-lkp@intel.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=mQINBE6V0TwBEADXhJg7s8wFDwBMEvn0qyhAnzFLTOCHooMZyx7XO7dAiIhDSi7G1NPxw
 n8jdFUQMCR/GlpozMFlSFiZXiObE7sef9rTtM68ukUyZM4pJ9l0KjQNgDJ6Fr342Htkjxu/kFV1Wv
 egyjnSsFt7EGoDjdKqr1TS9syJYFjagYtvWk/UfHlW09X+jOh4vYtfX7iYSx/NfqV3W1D7EDi0PqV
 T2h6v8i8YqsATFPwO4nuiTmL6I40ZofxVd+9wdRI4Db8yUNA4ZSP2nqLcLtFjClYRBoJvRWvsv4lm
 0OX6MYPtv76hka8lW4mnRmZqqx3UtfHX/hF/zH24Gj7A6sYKYLCU3YrI2Ogiu7/ksKcl7goQjpvtV
 YrOOI5VGLHge0awt7bhMCTM9KAfPc+xL/ZxAMVWd3NCk5SamL2cE99UWgtvNOIYU8m6EjTLhsj8sn
 VluJH0/RcxEeFbnSaswVChNSGa7mXJrTR22lRL6ZPjdMgS2Km90haWPRc8Wolcz07Y2se0xpGVLEQ
 cDEsvv5IMmeMe1/qLZ6NaVkNuL3WOXvxaVT9USW1+/SGipO2IpKJjeDZfehlB/kpfF24+RrK+seQf
 CBYyUE8QJpvTZyfUHNYldXlrjO6n5MdOempLqWpfOmcGkwnyNRBR46g/jf8KnPRwXs509yAqDB6sE
 LZH+yWr9LQZEwARAQABtCVKZWZmIExheXRvbiA8amxheXRvbkBwb29jaGllcmVkcy5uZXQ+iQI7BB
 MBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUCTpXWPAIZAQAKCRAADmhBGVaCFc65D/4
 gBLNMHopQYgG/9RIM3kgFCCQV0pLv0hcg1cjr+bPI5f1PzJoOVi9s0wBDHwp8+vtHgYhM54yt43uI
 7Htij0RHFL5eFqoVT4TSfAg2qlvNemJEOY0e4daljjmZM7UtmpGs9NN0r9r50W82eb5Kw5bc/r0km
 R/arUS2st+ecRsCnwAOj6HiURwIgfDMHGPtSkoPpu3DDp/cjcYUg3HaOJuTjtGHFH963B+f+hyQ2B
 rQZBBE76ErgTDJ2Db9Ey0kw7VEZ4I2nnVUY9B5dE2pJFVO5HJBMp30fUGKvwaKqYCU2iAKxdmJXRI
 ONb7dSde8LqZahuunPDMZyMA5+mkQl7kpIpR6kVDIiqmxzRuPeiMP7O2FCUlS2DnJnRVrHmCljLkZ
 Wf7ZUA22wJpepBligemtSRSbqCyZ3B48zJ8g5B8xLEntPo/NknSJaYRvfEQqGxgk5kkNWMIMDkfQO
 lDSXZvoxqU9wFH/9jTv1/6p8dHeGM0BsbBLMqQaqnWiVt5mG92E1zkOW69LnoozE6Le+12DsNW7Rj
 iR5K+27MObjXEYIW7FIvNN/TQ6U1EOsdxwB8o//Yfc3p2QqPr5uS93SDDan5ehH59BnHpguTc27Xi
 QQZ9EGiieCUx6Zh2ze3X2UW9YNzE15uKwkkuEIj60NvQRmEDfweYfOfPVOueC+iFifbQgSmVmZiBM
 YXl0b24gPGpsYXl0b25AcmVkaGF0LmNvbT6JAjgEEwECACIFAk6V0q0CGwMGCwkIBwMCBhUIAgkKC
 wQWAgMBAh4BAheAAAoJEAAOaEEZVoIViKUQALpvsacTMWWOd7SlPFzIYy2/fjvKlfB/Xs4YdNcf9q
 LqF+lk2RBUHdR/dGwZpvw/OLmnZ8TryDo2zXVJNWEEUFNc7wQpl3i78r6UU/GUY/RQmOgPhs3epQC
 3PMJj4xFx+VuVcf/MXgDDdBUHaCTT793hyBeDbQuciARDJAW24Q1RCmjcwWIV/pgrlFa4lAXsmhoa
 c8UPc82Ijrs6ivlTweFf16VBc4nSLX5FB3ls7S5noRhm5/Zsd4PGPgIHgCZcPgkAnU1S/A/rSqf3F
 LpU+CbVBDvlVAnOq9gfNF+QiTlOHdZVIe4gEYAU3CUjbleywQqV02BKxPVM0C5/oVjMVx3bri75n1
 TkBYGmqAXy9usCkHIsG5CBHmphv9MHmqMZQVsxvCzfnI5IO1+7MoloeeW/lxuyd0pU88dZsV/riHw
 87i2GJUJtVlMl5IGBNFpqoNUoqmvRfEMeXhy/kUX4Xc03I1coZIgmwLmCSXwx9MaCPFzV/dOOrju2
 xjO+2sYyB5BNtxRqUEyXglpujFZqJxxau7E0eXoYgoY9gtFGsspzFkVNntamVXEWVVgzJJr/EWW0y
 +jNd54MfPRqH+eCGuqlnNLktSAVz1MvVRY1dxUltSlDZT7P2bUoMorIPu8p7ZCg9dyX1+9T6Muc5d
 Hxf/BBP/ir+3e8JTFQBFOiLNdFtB9KZWZmIExheXRvbiA8amxheXRvbkBzYW1iYS5vcmc+iQI4BBM
 BAgAiBQJOldK9AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAADmhBGVaCFWgWD/0ZRi4h
 N9FK2BdQs9RwNnFZUr7JidAWfCrs37XrA/56olQl3ojn0fQtrP4DbTmCuh0SfMijB24psy1GnkPep
 naQ6VRf7Dxg/Y8muZELSOtsv2CKt3/02J1BBitrkkqmHyni5fLLYYg6fub0T/8Kwo1qGPdu1hx2BQ
 RERYtQ/S5d/T0cACdlzi6w8rs5f09hU9Tu4qV1JLKmBTgUWKN969HPRkxiojLQziHVyM/weR5Reu6
 FZVNuVBGqBD+sfk/c98VJHjsQhYJijcsmgMb1NohAzwrBKcSGKOWJToGEO/1RkIN8tqGnYNp2G+aR
 685D0chgTl1WzPRM6mFG1+n2b2RR95DxumKVpwBwdLPoCkI24JkeDJ7lXSe3uFWISstFGt0HL8Eew
 P8RuGC8s5h7Ct91HMNQTbjgA+Vi1foWUVXpEintAKgoywaIDlJfTZIl6Ew8ETN/7DLy8bXYgq0Xzh
 aKg3CnOUuGQV5/nl4OAX/3jocT5Cz/OtAiNYj5mLPeL5z2ZszjoCAH6caqsF2oLyAnLqRgDgR+wTQ
 T6gMhr2IRsl+cp8gPHBwQ4uZMb+X00c/Amm9VfviT+BI7B66cnC7Zv6Gvmtu2rEjWDGWPqUgccB7h
 dMKnKDthkA227/82tYoFiFMb/NwtgGrn5n2vwJyKN6SEoygGrNt0SI84y6hEVbQlSmVmZiBMYXl0b
 24gPGpsYXl0b25AcHJpbWFyeWRhdGEuY29tPokCOQQTAQIAIwUCU4xmKQIbAwcLCQgHAwIBBhUIAg
 kKCwQWAgMBAh4BAheAAAoJEAAOaEEZVoIV1H0P/j4OUTwFd7BBbpoSp695qb6HqCzWMuExsp8nZjr
 uymMaeZbGr3OWMNEXRI1FWNHMtcMHWLP/RaDqCJil28proO+PQ/yPhsr2QqJcW4nr91tBrv/MqItu
 AXLYlsgXqp4BxLP67bzRJ1Bd2x0bWXurpEXY//VBOLnODqThGEcL7jouwjmnRh9FTKZfBDpFRaEfD
 FOXIfAkMKBa/c9TQwRpx2DPsl3eFWVCNuNGKeGsirLqCxUg5kWTxEorROppz9oU4HPicL6rRH22Ce
 6nOAON2vHvhkUuO3GbffhrcsPD4DaYup4ic+DxWm+DaSSRJ+e1yJvwi6NmQ9P9UAuLG93S2MdNNbo
 sZ9P8k2mTOVKMc+GooI9Ve/vH8unwitwo7ORMVXhJeU6Q0X7zf3SjwDq2lBhn1DSuTsn2DbsNTiDv
 qrAaCvbsTsw+SZRwF85eG67eAwouYk+dnKmp1q57LDKMyzysij2oDKbcBlwB/TeX16p8+LxECv51a
 sjS9TInnipssssUDrHIvoTTXWcz7Y5wIngxDFwT8rPY3EggzLGfK5Zx2Q5S/N0FfmADmKknG/D8qG
 IcJE574D956tiUDKN4I+/g125ORR1v7bP+OIaayAvq17RP+qcAqkxc0x8iCYVCYDouDyNvWPGRhbL
 UO7mlBpjW9jK9e2fvZY9iw3QzIPGKtClKZWZmIExheXRvbiA8amVmZi5sYXl0b25AcHJpbWFyeWRh
 dGEuY29tPokCOQQTAQIAIwUCU4xmUAIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEAAOa
 EEZVoIVzJoQALFCS6n/FHQS+hIzHIb56JbokhK0AFqoLVzLKzrnaeXhE5isWcVg0eoV2oTScIwUSU
 apy94if69tnUo4Q7YNt8/6yFM6hwZAxFjOXR0ciGE3Q+Z1zi49Ox51yjGMQGxlakV9ep4sV/d5a50
 M+LFTmYSAFp6HY23JN9PkjVJC4PUv5DYRbOZ6Y1+TfXKBAewMVqtwT1Y+LPlfmI8dbbbuUX/kKZ5d
 dhV2736fgyfpslvJKYl0YifUOVy4D1G/oSycyHkJG78OvX4JKcf2kKzVvg7/Rnv+AueCfFQ6nGwPn
 0P91I7TEOC4XfZ6a1K3uTp4fPPs1Wn75X7K8lzJP/p8lme40uqwAyBjk+IA5VGd+CVRiyJTpGZwA0
 jwSYLyXboX+Dqm9pSYzmC9+/AE7lIgpWj+3iNisp1SWtHc4pdtQ5EU2SEz8yKvDbD0lNDbv4ljI7e
 flPsvN6vOrxz24mCliEco5DwhpaaSnzWnbAPXhQDWb/lUgs/JNk8dtwmvWnqCwRqElMLVisAbJmC0
 BhZ/Ab4sph3EaiZfdXKhiQqSGdK4La3OTJOJYZphPdGgnkvDV9Pl1QZ0ijXQrVIy3zd6VCNaKYq7B
 AKidn5g/2Q8oio9Tf4XfdZ9dtwcB+bwDJFgvvDYaZ5bI3ln4V3EyW5i2NfXazz/GA/I/ZtbsigCFc
 8ftCBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPokCOAQTAQIAIgUCWe8u6AIbAwYLCQg
 HAwIGFQgCCQoLBBYCAwECHgECF4AACgkQAA5oQRlWghUuCg/+Lb/xGxZD2Q1oJVAE37uW308UpVSD
 2tAMJUvFTdDbfe3zKlPDTuVsyNsALBGclPLagJ5ZTP+Vp2irAN9uwBuacBOTtmOdz4ZN2tdvNgozz
 uxp4CHBDVzAslUi2idy+xpsp47DWPxYFIRP3M8QG/aNW052LaPc0cedYxp8+9eiVUNpxF4SiU4i9J
 DfX/sn9XcfoVZIxMpCRE750zvJvcCUz9HojsrMQ1NFc7MFT1z3MOW2/RlzPcog7xvR5ENPH19ojRD
 CHqumUHRry+RF0lH00clzX/W8OrQJZtoBPXv9ahka/Vp7kEulcBJr1cH5Wz/WprhsIM7U9pse1f1g
 Yy9YbXtWctUz8uvDR7shsQxAhX3qO7DilMtuGo1v97I/Kx4gXQ52syh/w6EBny71CZrOgD6kJwPVV
 AaM1LRC28muq91WCFhs/nzHozpbzcheyGtMUI2Ao4K6mnY+3zIuXPygZMFr9KXE6fF7HzKxKuZMJO
 aEZCiDOq0anx6FmOzs5E6Jqdpo/mtI8beK+BE7Va6ni7YrQlnT0i3vaTVMTiCThbqsB20VrbMjlhp
 f8lfK1XVNbRq/R7GZ9zHESlsa35ha60yd/j3pu5hT2xyy8krV8vGhHvnJ1XRMJBAB/UYb6FyC7S+m
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-07-14 at 19:02 +0800, kernel test robot wrote:
>=20
> Hello,
>=20
> kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" o=
n:
>=20
> commit: 6602c8010ff4cabd759599c11175fa4d1bcd7800 ("tmpfs: add support for=
 multigrain timestamps")
> https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git mgtime
>=20
> in testcase: boot
>=20
> compiler: gcc-13
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>=20
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>=20
>=20
> +---------------------------------------------+------------+------------+
> >                                             | ff453163c6 | 6602c8010f |
> +---------------------------------------------+------------+------------+
> > boot_successes                              | 6          | 0          |
> > boot_failures                               | 0          | 7          |
> > BUG:unable_to_handle_page_fault_for_address | 0          | 7          |
> > Oops                                        | 0          | 7          |
> > EIP:percpu_counter_add_batch                | 0          | 7          |
> > Kernel_panic-not_syncing:Fatal_exception    | 0          | 7          |
> +---------------------------------------------+------------+------------+
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202407141802.19588609-lkp@intel.=
com
>=20
>=20
> [    0.638478][    T0] BUG: unable to handle page fault for address: 20c4=
e000
> [    0.639256][    T0] #PF: supervisor read access in kernel mode
> [    0.639920][    T0] #PF: error_code(0x0000) - not-present page
> [    0.640224][    T0] *pdpt =3D 0000000000000000 *pde =3D 00000000000000=
00
> [    0.640224][    T0] Oops: Oops: 0000 [#1] PREEMPT SMP PTI
> [    0.640224][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.10.0-r=
c7-00242-g6602c8010ff4 #1
> [    0.640224][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 0.640224][ T0] EIP: percpu_counter_add_batch (lib/percpu_counter.c:93 (=
discriminator 4))=20
> [ 0.640224][ T0] Code: 00 8b 5d f4 8b 75 f8 8b 7d fc 89 ec 5d 31 c0 31 d2=
 31 c9 e9 3e 7d 8b 00 8d b4 26 00 00 00 00 8d 76 00 e8 f7 22 91 ff 8b 4b 3c=
 <64> 8b 01 89 45 e0 89 c6 89 c7 c1 ff 1f 03 75 ec 13 7d f0 89 f2 f7
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	00 8b 5d f4 8b 75    	add    %cl,0x758bf45d(%rbx)
>    6:	f8                   	clc
>    7:	8b 7d fc             	mov    -0x4(%rbp),%edi
>    a:	89 ec                	mov    %ebp,%esp
>    c:	5d                   	pop    %rbp
>    d:	31 c0                	xor    %eax,%eax
>    f:	31 d2                	xor    %edx,%edx
>   11:	31 c9                	xor    %ecx,%ecx
>   13:	e9 3e 7d 8b 00       	jmp    0x8b7d56
>   18:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
>   1f:	8d 76 00             	lea    0x0(%rsi),%esi
>   22:	e8 f7 22 91 ff       	call   0xffffffffff91231e
>   27:	8b 4b 3c             	mov    0x3c(%rbx),%ecx
>   2a:*	64 8b 01             	mov    %fs:(%rcx),%eax		<-- trapping instruc=
tion
>   2d:	89 45 e0             	mov    %eax,-0x20(%rbp)
>   30:	89 c6                	mov    %eax,%esi
>   32:	89 c7                	mov    %eax,%edi
>   34:	c1 ff 1f             	sar    $0x1f,%edi
>   37:	03 75 ec             	add    -0x14(%rbp),%esi
>   3a:	13 7d f0             	adc    -0x10(%rbp),%edi
>   3d:	89 f2                	mov    %esi,%edx
>   3f:	f7                   	.byte 0xf7
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	64 8b 01             	mov    %fs:(%rcx),%eax
>    3:	89 45 e0             	mov    %eax,-0x20(%rbp)
>    6:	89 c6                	mov    %eax,%esi
>    8:	89 c7                	mov    %eax,%edi
>    a:	c1 ff 1f             	sar    $0x1f,%edi
>    d:	03 75 ec             	add    -0x14(%rbp),%esi
>   10:	13 7d f0             	adc    -0x10(%rbp),%edi
>   13:	89 f2                	mov    %esi,%edx
>   15:	f7                   	.byte 0xf7
> [    0.640224][    T0] EAX: 00000000 EBX: c38590e0 ECX: 00000000 EDX: 000=
00000
> [    0.640224][    T0] ESI: c3d440d8 EDI: c28d9e20 EBP: c28d9d68 ESP: c28=
d9d48
> [    0.640224][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAG=
S: 00210046
> [    0.640224][    T0] CR0: 80050033 CR2: 20c4e000 CR3: 03112000 CR4: 000=
406b0
> [    0.640224][    T0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [    0.640224][    T0] DR6: fffe0ff0 DR7: 00000400
> [    0.640224][    T0] Call Trace:
> [ 0.640224][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:479)=20
> [ 0.640224][ T0] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel=
/dumpstack.c:434)=20
> [ 0.640224][ T0] ? oops_enter (kernel/panic.c:582 kernel/panic.c:640)=20
> [ 0.640224][ T0] ? page_fault_oops (arch/x86/mm/fault.c:715 (discriminato=
r 1))=20
> [ 0.640224][ T0] ? kernelmode_fixup_or_oops+0x78/0x94=20
> [ 0.640224][ T0] ? __bad_area_nosemaphore+0x145/0x280=20
> [ 0.640224][ T0] ? coarse_ctime (fs/inode.c:2164)=20
> [ 0.640224][ T0] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91 (d=
iscriminator 2))=20
> [ 0.640224][ T0] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:267)=20
> [ 0.640224][ T0] ? local_clock_noinstr (kernel/sched/clock.c:270 kernel/s=
ched/clock.c:306)=20
> [ 0.640224][ T0] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835)=20
> [ 0.640224][ T0] ? do_user_addr_fault (arch/x86/mm/fault.c:1452)=20
> [ 0.640224][ T0] ? coarse_ctime (fs/inode.c:2164)=20
> [ 0.640224][ T0] ? local_clock (arch/x86/include/asm/preempt.h:94 (discri=
minator 1) kernel/sched/clock.c:316 (discriminator 1))=20
> [ 0.640224][ T0] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arc=
h/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x8=
6/mm/fault.c:1489 arch/x86/mm/fault.c:1539)=20
> [ 0.640224][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:149=
4)=20
> [ 0.640224][ T0] ? handle_exception (arch/x86/entry/entry_32.S:1047)=20
> [ 0.640224][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:149=
4)=20
> [ 0.640224][ T0] ? percpu_counter_add_batch (lib/percpu_counter.c:93 (dis=
criminator 4))=20
> [ 0.640224][ T0] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:149=
4)=20
> [ 0.640224][ T0] ? percpu_counter_add_batch (lib/percpu_counter.c:93 (dis=
criminator 4))=20
> [ 0.640224][ T0] inode_set_ctime_current (fs/inode.c:2681)=20

Ahh, looks like I'm initializing the percpu vars a bit too late
(late_initcall). I'll move the initialization to fs_initcall().


> [ 0.640224][ T0] ? get_random_u32 (drivers/char/random.c:532 (discriminat=
or 1))=20
> [ 0.640224][ T0] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:94 (d=
iscriminator 1) include/linux/spinlock_api_smp.h:143 (discriminator 1) kern=
el/locking/spinlock.c:186 (discriminator 1))=20
> [ 0.640224][ T0] simple_inode_init_ts (fs/libfs.c:2101)=20
> [ 0.640224][ T0] __shmem_get_inode (mm/shmem.c:2526 (discriminator 3))=
=20
> [ 0.640224][ T0] shmem_get_inode (mm/shmem.c:2586 (discriminator 1))=20
> [ 0.640224][ T0] shmem_fill_super (mm/shmem.c:4432 (discriminator 1))=20
> [ 0.640224][ T0] ? shmem_add_to_page_cache+0x2dc/0x2dc=20
> [ 0.640224][ T0] get_tree_nodev (fs/super.c:1270 fs/super.c:1288)=20
> [ 0.640224][ T0] shmem_get_tree (mm/shmem.c:4451)=20
> [ 0.640224][ T0] vfs_get_tree (fs/super.c:1790)=20
> [ 0.640224][ T0] vfs_kern_mount (fs/namespace.c:1281)=20
> [ 0.640224][ T0] kern_mount (fs/namespace.c:5487 (discriminator 1))=20
> [ 0.640224][ T0] shmem_init (mm/shmem.c:4686 (discriminator 1))=20
> [ 0.640224][ T0] ? shmem_parse_one (mm/shmem.c:4500)=20
> [ 0.640224][ T0] mnt_init (fs/namespace.c:5471)=20
> [ 0.640224][ T0] ? files_init (fs/file_table.c:519)=20
> [ 0.640224][ T0] vfs_caches_init (fs/dcache.c:3217)=20
> [ 0.640224][ T0] start_kernel (init/main.c:1086)=20
> [ 0.640224][ T0] ? obsolete_checksetup (init/main.c:544)=20
> [ 0.640224][ T0] i386_start_kernel (arch/x86/kernel/head32.c:69)=20
> [ 0.640224][ T0] startup_32_smp (arch/x86/kernel/head_32.S:292)=20
> [    0.640224][    T0] Modules linked in:
> [    0.640224][    T0] CR2: 0000000020c4e000
> [    0.640224][    T0] ---[ end trace 0000000000000000 ]---
> [ 0.640224][ T0] EIP: percpu_counter_add_batch (lib/percpu_counter.c:93 (=
discriminator 4))=20
> [ 0.640224][ T0] Code: 00 8b 5d f4 8b 75 f8 8b 7d fc 89 ec 5d 31 c0 31 d2=
 31 c9 e9 3e 7d 8b 00 8d b4 26 00 00 00 00 8d 76 00 e8 f7 22 91 ff 8b 4b 3c=
 <64> 8b 01 89 45 e0 89 c6 89 c7 c1 ff 1f 03 75 ec 13 7d f0 89 f2 f7
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	00 8b 5d f4 8b 75    	add    %cl,0x758bf45d(%rbx)
>    6:	f8                   	clc
>    7:	8b 7d fc             	mov    -0x4(%rbp),%edi
>    a:	89 ec                	mov    %ebp,%esp
>    c:	5d                   	pop    %rbp
>    d:	31 c0                	xor    %eax,%eax
>    f:	31 d2                	xor    %edx,%edx
>   11:	31 c9                	xor    %ecx,%ecx
>   13:	e9 3e 7d 8b 00       	jmp    0x8b7d56
>   18:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
>   1f:	8d 76 00             	lea    0x0(%rsi),%esi
>   22:	e8 f7 22 91 ff       	call   0xffffffffff91231e
>   27:	8b 4b 3c             	mov    0x3c(%rbx),%ecx
>   2a:*	64 8b 01             	mov    %fs:(%rcx),%eax		<-- trapping instruc=
tion
>   2d:	89 45 e0             	mov    %eax,-0x20(%rbp)
>   30:	89 c6                	mov    %eax,%esi
>   32:	89 c7                	mov    %eax,%edi
>   34:	c1 ff 1f             	sar    $0x1f,%edi
>   37:	03 75 ec             	add    -0x14(%rbp),%esi
>   3a:	13 7d f0             	adc    -0x10(%rbp),%edi
>   3d:	89 f2                	mov    %esi,%edx
>   3f:	f7                   	.byte 0xf7
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	64 8b 01             	mov    %fs:(%rcx),%eax
>    3:	89 45 e0             	mov    %eax,-0x20(%rbp)
>    6:	89 c6                	mov    %eax,%esi
>    8:	89 c7                	mov    %eax,%edi
>    a:	c1 ff 1f             	sar    $0x1f,%edi
>    d:	03 75 ec             	add    -0x14(%rbp),%esi
>   10:	13 7d f0             	adc    -0x10(%rbp),%edi
>   13:	89 f2                	mov    %esi,%edx
>   15:	f7                   	.byte 0xf7
>=20
>=20
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240714/202407141802.19588609-lk=
p@intel.com
>=20
>=20
>=20

--=20
Jeff Layton <jlayton@kernel.org>

Content-Type: multipart/mixed; boundary="===============1106423552477841874=="
MIME-Version: 1.0
From: Johannes Thumshirn <jthumshirn@suse.de>
To: lkp@lists.01.org
Subject: Re: [block] 4e366a7962: blktests.nvme.005.fail
Date: Fri, 29 Mar 2019 09:18:59 +0100
Message-ID: <a776e212-f1c2-0b34-11ff-8600c058c01c@suse.de>
In-Reply-To: <CACVXFVPi4WHcthPey4xKT8Jxwkq40J3iLu5v_sprD=eFjs4Qrg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1106423552477841874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/03/2019 01:33, Ming Lei wrote:
[...]

>> +       blk_queue_segment_boundary(ctrl->ctrl.admin_q, PAGE_SIZE - 1);
> =

> The above isn't needed for linus tree, however it is required for 5.0 and=
 older
> releases.

Yes but it was worth a try after days of failing to find the issue.

> But nvme-loop target have other problems, and I'd suggest you to apply
> the following patch:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/com=
mit/?h=3Dfor-linus&id=3D02db99548d3608a625cf481cff2bb7b626829b3f

This only applies to the file backed target, doesn't it? My testcase
uses bdev backed namespaces.

[...]

>>  731
>>  732   /* If we may be able to merge these biovecs, force a recount */
>>  733   if (bio->bi_vcnt > 1 && biovec_phys_mergeable(q, bvec - 1, bvec))
>>  734           bio->bi_phys_segments =3D -1;
> =

> The above change from you might cause issue given some queue's .bi_phys_s=
egments
> is 255.

65535 but yes there are drivers setting it to USHRT_MAX. I'll have to
see if I can get hold of one for testing.
 [...]

> I'd suggest you to address the following comments first before working on
> your patch:
> =

> https://lore.kernel.org/linux-block/CACVXFVNPW1TOsCaAibc-YJHDEdK95Y8-v1rH=
Naab7oV=3Deb+8TA(a)mail.gmail.com/
> =

> https://lore.kernel.org/linux-block/CACVXFVOq1ngjpD62SreSZda5k_WJjxOZRHwp=
qt6si7bRv=3DO46Q(a)mail.gmail.com/

I'll have a look, thanks.

[...]

> Can you trigger this issue on linus tree or 5.2-tmp of block tree?

I haven't been able to trigger it on vanilla so far, so it's most likely
related to the patch. Will rebase the patchset to 5.2-tmp and retest
from there.

Thanks,
	Johannes
-- =

Johannes Thumshirn                            SUSE Labs Filesystems
jthumshirn(a)suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850

--===============1106423552477841874==--


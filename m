Content-Type: multipart/mixed; boundary="===============1170119789574608026=="
MIME-Version: 1.0
From: Ming Lei <tom.leiming@gmail.com>
To: lkp@lists.01.org
Subject: Re: [jet.chen@intel.com: [bio] kernel BUG at drivers/block/virtio_blk.c:166!]
Date: Tue, 27 May 2014 12:03:29 +0800
Message-ID: <CACVXFVOaF-EOioE38sy9=2f-+rKECJnzUCSHrL-VZJi1Ycj_wA@mail.gmail.com>
In-Reply-To: <20140526194347.GB2271@dhcp-27-189.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1170119789574608026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2014 at 3:43 AM, Maurizio Lombardi <mlombard@redhat.com> =
wrote:
> Hi Jens,
>
> looks like that commit 3979ef4dcf3d1de55a560a3a4016c30a835df44d ("bio-mod=
ify-__bio_add_page-to-accept-pages-that-dont-start-a-new-segment-v3")
> introduces a regression, as reported by Jet Chan.
>
> Do you have any idea about the possible problem with this patch?
>
> it is the one that performs a recount of the segments in case of failure =
in __bio_add_page()
>
> http://www.spinics.net/lists/mm-commits/msg103684.html
>
> I would not be surprised if the bug was introduced by fceb38f36f, because=
 it
> contained a mystake that commit 3979ef4dcf supposedly fixed.
> But learning that commit 3979ef4dcf is introducing a regression leaves
> me quite puzzled.

>From code of __blk_recalc_rq_segments(), looks it
won't check if recounted physical segment number is
bigger than queue_max_segments(), so wondering if
blk_recount_segments() can always decrease
physical segment number.

Thanks,
--
Ming Lei

--===============1170119789574608026==--


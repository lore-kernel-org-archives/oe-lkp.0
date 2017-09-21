Content-Type: multipart/mixed; boundary="===============6593693842415651384=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [blk] 47e0fb461f: BUG:unable_to_handle_kernel
Date: Thu, 21 Sep 2017 09:02:29 +0200
Message-ID: <87a81or0u2.fsf@notabene.neil.brown.name>
In-Reply-To: <20170921024603.GB8188@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6593693842415651384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21 2017, kernel test robot wrote:

> FYI, we noticed the following commit:
>
> commit: 47e0fb461fca1a68a566c82fcc006cc787312d8c ("blk: make the bioset r=
escue_workqueue optional.")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu IvyBridge -m 420M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Interesting.
I cannot see how that bug could be caused by that patch.

I think it is crashing in
static inline bool ata_is_host_link(const struct ata_link *link)
{
	return link =3D=3D &link->ap->link || link =3D=3D link->ap->slave_link;
}
from
static inline int ata_link_max_devices(const struct ata_link *link)
{
	if (ata_is_host_link(link) && link->ap->flags & ATA_FLAG_SLAVE_POSS)
		return 2;
	return 1;
}
from ata_dev_next().

I think %rdi holds link->ap, so the "link->ap->slave_link" dereference
causes the crash.

link->ap seems to be initialized quite early, and never cleared, so I
don't know how it could  be NULL...

Confused.

Thanks,
NeilBrown

--===============6593693842415651384==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVHOFlwNjlPUTJI
QjdYMGw2T2V5ZTNWWmlnYmtGQWxuRFpBVUFDZ2tRT2V5ZTNWWmkKZ2JtcU94QUFtU01QOFhLaGRM
NHpVK1pwcmlMWUdlYUtNN0c1cTdmdW9MVEJKZHA1b3h1SUo1UFB6UzAyU2tNSApFd0ZkclkrOENU
bTBuUE9lNHZEVjBCRitNWEtTY1VGcmNGdER4ZDR2NmRGTkdVRHAxNlg2U3ZMTEt4cjFaUXZlCnB1
Ykt5aFh3QU5kNHNrWG01V3YzWEFyTXJXQXBKeXY1Mm9DOEVWUVdYRU5RTlJTT1AweUR3SWovZHBp
UXF0dE0KdTBkY1lDKzdmbGpjaitYRElPSFRXVWJEWGFGcTlydkJSRSs0dmJSOW0xcmtQMUd6TnFa
RG5kSUlDTytSd0YyZwpmaHdjQVRiV3dYa3FTZVpPaFVDTGgwVUJ1UEc0K0hCRkRkcTJnVERnVHVo
alRvQzJXaFIyaWJDUUFBRlNvMFk2CjVHMTNOMjhTdkFPQVBKVjJ4SDBkWkFyVVUzQWd0MHNMaFVo
RHp1OWtDVEhQZ0hJVko1cjNCQ0QwYVRjdlJzaFYKUEZPQi83RDYzRW4yT0FSMjdtRFhyVGkxSGVZ
U2lRZzZPdTc1cWZWYTl3TW5xNXhLdnpVZFJKRHlIZ2FMY29xSQp3clFwekF3cHRtVkxYREJRYnR2
eWlTRWpRMTdpeklPOWhrbWlCQTQ1ckRVZjRmTnB2T1NxamppWXVNT3YzNVZDCmovZGV6M2E3eGdi
d3BqQ1JOZFBVTVc1UmlNUEdWVGR2UlBRN2NDZVIzOTZoNGgrY1lveE02QnY5WVNRUi9iSlkKWWZt
ZkdtSGxWWUdZMTdYY1crcHVEWENRaW9ZaE83WFI1bFFhRlNQbmJ1OVA2OHVPazRnQ2wvZlJlU3BO
WUUrUwpBakFRaGV2VVg3RlMzV3FhSUYreTRqNDRMcmdPeDNJb25PaWtHSWczRGZEWU1OTWNlMFk9
Cj1RcFA2Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============6593693842415651384==--


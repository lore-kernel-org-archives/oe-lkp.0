Content-Type: multipart/mixed; boundary="===============4085166043909933389=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [iommu/vt] c1b9a54b6f:
Date: Thu, 08 Oct 2015 11:09:21 +0800
Message-ID: <20151008030921.GA22560@dhcp-128-28.nay.redhat.com>
In-Reply-To: <874mi2xejc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4085166043909933389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 10/08/15 at 10:47am, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> git://internal_mailing_list_patch_tree Baoquan-He/iommu-vt-d-break-the-fo=
r-loop-if-an-empty-ir_ioapic-entry-found
> commit c1b9a54b6f21f22bb5fba5cb981da0be06011476 ("iommu/vt-d: Adjsut the =
return value of the parse_ioapics_under_ir")

> =

> The following new message in kernel log may make end user confusing.
> The test was done without hibernation.
> =

> [    0.241752] DMAR-IR: Failed to copy IR table for dmar0 from previous k=
ernel
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

The first patch need be dropped since the original code is reasonable.
Only patch 2/2 is good, I will repost patch 2/2 alone according to
Joerg's comment.

[PATCH 1/2] iommu/vt-d: break the for loop if an empty ir_ioapic entry
found


Thanks
Baoquan

--===============4085166043909933389==--


Content-Type: multipart/mixed; boundary="===============7127489667728707321=="
MIME-Version: 1.0
From: Arun Parameswaran <aparames@broadcom.com>
To: lkp@lists.01.org
Subject: Re: [net] 041de4d656: bcm_phy_lib: module license 'unspecified' taints kernel.
Date: Tue, 13 Oct 2015 12:25:06 -0700
Message-ID: <561D5A92.2030800@broadcom.com>
In-Reply-To: <87h9lwliey.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7127489667728707321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 15-10-11 11:17 PM, kernel test robot wrote:
> FYI, we noticed the below changes on
>
> git://internal_mailing_list_patch_tree Arun-Parameswaran/Add-support-for-=
Broadcom-s-iProc-MDIO-and-Cygnus-Ethernet-PHY
> commit 041de4d6564535f639f0d4cec6712b5adf62723f ("net: phy: Add Broadcom =
phy library for common interfaces")
>
> Found new message as below in kernel log after the commit.
>
> [    2.527336] bcm_phy_lib: module license 'unspecified' taints kernel.
> [    2.527686] Disabling lock debugging due to kernel taint

Will fix this with a separate patch.

>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Ying Huang

Thanks,

Arun


--===============7127489667728707321==--


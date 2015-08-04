Content-Type: multipart/mixed; boundary="===============1084453576183355749=="
MIME-Version: 1.0
From: Ming Lin <mlin@kernel.org>
To: lkp@lists.01.org
Subject: Re: [block] 3b4809b8718: 70.0% vmstat.system.cs
Date: Tue, 04 Aug 2015 13:23:43 -0700
Message-ID: <CAF1ivSYZd+mM-UNPwfio0U2WbH8bqcfQqg40UNpj4m6qBkd9Ww@mail.gmail.com>
In-Reply-To: <87d1z38h90.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1084453576183355749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2015 at 3:44 AM, kernel test robot <ying.huang@intel.com> =
wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/mlin/linux.git block-generi=
c-req
> commit 3b4809b871881433e502d6fe70ae556bcfc9b10d ("block: remove split cod=
e in blkdev_issue_discard")

This is the old code. Here is the new one.
https://git.kernel.org/cgit/linux/kernel/git/mlin/linux.git/commit/?h=3Dblo=
ck-generic-req&id=3D9607f737

Thanks.

>
> [   26.092126] blk_update_request: I/O error, dev sdc, sector 0
> [   26.093754] request botched: dev sdc: type=3D1, flags=3D245b0081
> [   26.095326]   sector 0, nr/cnr 0/0
> [   26.096301] blk_update_request: I/O error, dev sdd, sector 0
> [   26.096303] request botched: dev sdd: type=3D1, flags=3D245b0081
> [   26.096304]   sector 0, nr/cnr 0/0
> [   26.096306]   bio ffff88003f69c600, biotail ffff88003f69c600, len 0
> [   26.096313] sd 0:0:1:2: [sdd] FAILED Result: hostbyte=3DDID_ERROR driv=
erbyte=3DDRIVER_OK
> [   26.096317] sd 0:0:1:2: [sdd] CDB: Unmap/Read sub-channel 42 00 00 00 =
00 00 00 00 18 00
> [   26.096318] blk_update_request: I/O error, dev sdd, sector 0
> [   26.108103] blk_update_request: I/O error, dev sda, sector 0
> [   26.108106] request botched: dev sda: type=3D1, flags=3D245b0081
> [   26.108107]   sector 0, nr/cnr 0/0
> [   26.108108]   bio ffff88003f60e000, biotail ffff88003f60e000, len 0
> [   26.108115] sd 0:0:1:0: [sda] FAILED Result: hostbyte=3DDID_ERROR driv=
erbyte=3DDRIVER_OK
> [   26.108119] sd 0:0:1:0: [sda] CDB: Unmap/Read sub-channel 42 00 00 00 =
00 00 00 00 18 00
> [   26.108120] blk_update_request: I/O error, dev sda, sector 0
> [   26.108139] blk_update_request: I/O error, dev sdb, sector 0
> [   26.108141] request botched: dev sdb: type=3D1, flags=3D245b0081
> [   26.108141]   sector 0, nr/cnr 0/0
> [   26.108142]   bio ffff88003f994600, biotail ffff88003f994600, len 0
> [   26.108145] sd 0:0:1:4: [sdb] FAILED Result: hostbyte=3DDID_ERROR driv=
erbyte=3DDRIVER_OK
> [   26.108147] sd 0:0:1:4: [sdb] CDB: Unmap/Read sub-channel 42 00 00 00 =
00 00 00 00 18 00
> [   26.108148] blk_update_request: I/O error, dev sdb, sector 0
> [   26.201490]   bio ffff88003f64a200, biotail ffff88003f64a200, len 0
> [   26.213616] sd 0:0:1:3: [sdc] FAILED Result: hostbyte=3DDID_ERROR driv=
erbyte=3DDRIVER_OK
> [   26.216062] sd 0:0:1:3: [sdc] CDB: Unmap/Read sub-channel 42 00 00 00 =
00 00 00 00 18 00
> [   26.218559] blk_update_request: I/O error, dev sdc, sector 0
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
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Ying Huang

--===============1084453576183355749==--


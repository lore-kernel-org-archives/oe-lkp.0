Content-Type: multipart/mixed; boundary="===============5824477010415822819=="
MIME-Version: 1.0
From: Thomas Hellstrom <thellstrom@vmware.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] 9599f1b321 [ 242.656062] INFO: task swapper:1 blocked for more than 120 seconds.
Date: Tue, 26 Jun 2018 11:51:49 +0200
Message-ID: <a334b3cd-4ead-e254-7ba6-e84ac6bc3064@vmware.com>
In-Reply-To: <20180626012251.GO11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5824477010415822819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 06/26/2018 03:22 AM, kernel test robot wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2F0day-ci%2Flinux%2Fcommits%2FThomas-Hellstrom%2Flocking-WW-mutex-clea=
nup%2F20180615-203604&data=3D02%7C01%7Cthellstrom%40vmware.com%7Cdf4bfcbb45=
15498c802b08d5db03d7c5%7Cb39138ca3cee4b4aa4d6cd83d9dd62f0%7C1%7C0%7C6366557=
31913881564&sdata=3Dh2ohVxLvPoYuzTv0h8om44HLFxt%2FAQ7PWmN04pCN8Uc%3D&reserv=
ed=3D0
>
> commit 9599f1b321cea599a6691756dbc4f421913df7ea
> Author:     Thomas Hellstrom <thellstrom@vmware.com>
> AuthorDate: Fri Jun 15 14:08:27 2018 +0200
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Fri Jun 15 20:36:05 2018 +0800
>
>      locking: Implement an algorithm choice for Wound-Wait mutexes
>      =


Not the latest version of the patch. Can't reproduce this lockup with v4.

Thanks,
Thomas


--===============5824477010415822819==--


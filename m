Content-Type: multipart/mixed; boundary="===============0249487655728911317=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: patch testing service here ?
Date: Tue, 30 Mar 2021 10:38:07 +0800
Message-ID: <63a0f254-5364-f4a7-ee24-05c8188e57bd@intel.com>
In-Reply-To: <CAJfuBxy0RxC-e_jVnN46r9TdbMJUM5uwSQrM3MwR-341q=vz6w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0249487655728911317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On 3/30/21 3:31 AM, jim.cromie(a)gmail.com wrote:
> hi all,
>
> I think im in the right place.
>
> I recently sent a patchset to LKML, and the robot found some
> crap that betrays my lack of automatic alt-config testing.
>
> does the kernel test robot watch this list too ?
yes, we watch the lkml and other kernel mailing lists.

> if so, can/should I use it for infant-mortality testing of revisions ?
we'll catch the revisions automatically.

>
> is there a FAQ somewhere about auto-testing service,
https://github.com/intel/lkp-tests/wiki/LKP-FAQ

> what lists are watched, how to submit a github repo for testing ?
> in case thats so, Ive pushed my next rev
>
> https://github.com/jimc/linux.git /lkp-test/dyndbg-diet
I have added your tree to our watch list, and we will send a build =

complete report to you if any branch updated.


>
> and since Im getting oriented (I hope)
> whats the right usage of Reported-by ?

Actually if the patch is WIP, you can mention it in the commit log,
if you want to create a new commit to fix it, please add 'Reported-by'.


>
> -v5 fix !CONFIG_DYNAMIC_DEBUG fn-stub
> Reported-by: kernel test robot <lkp(a)intel.com <mailto:lkp@intel.com>>
> or maybe
> Reported-by: <lkp(a)intel.com <mailto:lkp@intel.com>> # fix =

> !CONFIG_DYNAMIC_DEBUG fn-stub
>
> lastly, my patchset needs CONFIG_DYNAMIC_DEBUG=3Dy for active testing, =

> does the robot know that from context ?
> or is there a simple way to tell it ?
>

Don't worry, we have several default config files include =

"CONFIG_DYNAMIC_DEBUG=3Dy".

Best Regards,
Rong Chen
--===============0249487655728911317==--


Content-Type: multipart/mixed; boundary="===============3856417452405758392=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] kthread: to_live_kthread() needs try_get_task_stack()
Date: Thu, 30 Jun 2016 02:28:59 +0800
Message-ID: <201606300245.vASQFf80%fengguang.wu@intel.com>
In-Reply-To: <20160629180357.GA7178@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3856417452405758392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

[auto build test ERROR on linus/master]
[also build test ERROR on v4.7-rc5 next-20160629]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp improve the system]

url:    https://github.com/0day-ci/linux/commits/Oleg-Nesterov/kthread-to_l=
ive_kthread-needs-try_get_task_stack/20160630-020824
config: i386-tinyconfig (attached as .config)
compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


All errors (new ones prefixed by >>):

   kernel/kthread.c: In function 'to_live_kthread':
>> kernel/kthread.c:67:23: error: implicit declaration of function 'try_get=
_task_stack' [-Werror=3Dimplicit-function-declaration]
     if (likely(vfork) && try_get_task_stack(k))
                          ^~~~~~~~~~~~~~~~~~
   kernel/kthread.c: In function 'kthread_unpark':
>> kernel/kthread.c:430:3: error: implicit declaration of function 'put_tas=
k_stack' [-Werror=3Dimplicit-function-declaration]
      put_task_stack(k);
      ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/try_get_task_stack +67 kernel/kthread.c

    61		return __to_kthread(k->vfork_done);
    62	}
    63	=

    64	static struct kthread *to_live_kthread(struct task_struct *k)
    65	{
    66		struct completion *vfork =3D ACCESS_ONCE(k->vfork_done);
  > 67		if (likely(vfork) && try_get_task_stack(k))
    68			return __to_kthread(vfork);
    69		return NULL;
    70	}

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on

--===============3856417452405758392==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
w6PrTNfM6+CaMtKyBOA/7OSeg+RZAAA=
--===============3856417452405758392==--


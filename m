Content-Type: multipart/mixed; boundary="===============1257559757455271332=="
MIME-Version: 1.0
From: Bae, Chang Seok <chang.seok.bae@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Tue, 07 Dec 2021 18:49:59 +0000
Message-ID: <81783AEA-1313-4353-837D-8217DEF3B9A2@intel.com>
In-Reply-To: <87bl1s357p.ffs@tglx>
List-Id: <oe-lkp.lists.linux.dev>

--===============1257559757455271332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Dec 7, 2021, at 05:38, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, Dec 07 2021 at 09:21, kernel test robot wrote:
>> (please be noted we made some further analysis before reporting out,
>> and thought it's likely the regression is related with the extra spinlock
>> introducded by enalbling DYNAMIC_SIGFRAME. below is the full report.)
>> =

>> FYI, we noticed a -11.9% regression of will-it-scale.per_thread_ops due =
to commit:
> =

> Does that use sigaltstack() ?

FWIW, I was also wondering about this with:

$ git clone https://github.com/antonblanchard/will-it-scale.git
$ cd will-it-scale/
$ git grep sigaltstack
$

But, the test seems to use python via runtest.py. And the python code has
sigaltstack():
    https://github.com/python/cpython/blob/main/Modules/faulthandler.c#L454

Thanks,
Chang
--===============1257559757455271332==--


Content-Type: multipart/mixed; boundary="===============8544800394512532494=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [mm/highmem] 61b205f579: WARNING:at_mm/highmem.c:#__kmap_local_sched_out
Date: Wed, 17 Mar 2021 14:44:41 +0100
Message-ID: <87blbhzygm.fsf@nanos.tec.linutronix.de>
In-Reply-To: <20210316073756.GQ3014244@iweiny-DESK2.sc.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8544800394512532494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16 2021 at 00:37, Ira Weiny wrote:
>
> I think I see the issue.  I think this is an invalid configuration.
>
> 00:26:43 > grep DEBUG_KMAP config-5.11.0-rc7-00002-g61b205f57991 =

> CONFIG_DEBUG_KMAP_LOCAL=3Dy
> CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=3Dy
>
> 00:26:48 > grep DEBUG_HIGHMEM config-5.11.0-rc7-00002-g61b205f57991 =

> # CONFIG_DEBUG_HIGHMEM is not set

No. It's valid so you can test that crap on 64bit.

> DEBUG_KMAP_LOCAL causes guard pages to be added to the kmap_ctrl array.  =
But
> DEBUG_HIGHMEM is used in __kmap_local_sched_out() to check the guard page=
s.
>
> DEBUG_HIGHMEM is supposed to select DEBUG_KMAP_LOCAL...  but apparently t=
hat
> did not happen when this configuration was made.
>
> I still have not hit this condition in my testing.  Could you ensure that
> DEBUG_HIGMEM is set and rerun the test to see if I am correct?

Why? The whole point of CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is to allow
testing of this kmap_local/atomic stuff w/o HIGHMEM, e.g. on 64 bit.

> Thomas wouldn't the following enable checks make more sense?  Or perhaps =
be
> more consistent with the processing of kmap_ctrl?

Neither nor. It's simply required to make DEBUG_KMAP_LOCAL=3Dy &&
HIGHMEM=3Dn case work.

Please add:
Fixes: 0e91a0c6984c ("mm/highmem: Provide CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=
")

which should have contained exactly that change:

> -               if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !(i & 0x01)) {
> +               if (IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL) && !(i & 0x01)) {
>                         WARN_ON_ONCE(!pte_none(pteval));
>                         continue;
>                 }
> @@ -654,7 +654,7 @@ void __kmap_local_sched_in(void)
>                 int idx;
>  =

>                 /* With debug all even slots are unmapped and act as guar=
d */
> -               if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !(i & 0x01)) {
> +               if (IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL) && !(i & 0x01)) {
>                         WARN_ON_ONCE(!pte_none(pteval));
>                         continue;
>                 }

Thanks,

        tglx
--===============8544800394512532494==--


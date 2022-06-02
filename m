Content-Type: multipart/mixed; boundary="===============5953339829171488213=="
MIME-Version: 1.0
From: John Ogness <john.ogness@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [printk] 8e27473211: hwsim.ap_ft_pmf_bip_cmac_128.fail
Date: Thu, 02 Jun 2022 10:42:34 +0206
Message-ID: <875yljwjfx.fsf@jogness.linutronix.de>
In-Reply-To: <20220602071033.GA27190@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5953339829171488213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022-06-02, Oliver Sang <oliver.sang@intel.com> wrote:
> we got this test suite from
> https://github.com/bcopeland/wmediumd. there is a detail README there,
> hope it would be helpful to you.

Great, thanks!

> _but_, since you mentioned it's difficult to reproduce, we did more tests,
> and found this could be platform specific.
>
> first, we queued more jobs to platform from which the original report was=
 made,
>
> model: Skylake
> nr_cpu: 4
> memory: 32G
> brand: Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz
>
> and confirmed the parent is still clean, and tests still failed on
> 8e27473211

I have located a skylake hardware platform that is similar to this
one. I will try the tests there. Thanks for this information!

John Ogness
--===============5953339829171488213==--


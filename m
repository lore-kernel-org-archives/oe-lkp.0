Content-Type: multipart/mixed; boundary="===============8402994878259513516=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: Some questions on 0-day
Date: Mon, 02 Sep 2019 06:26:26 +0200
Message-ID: <CACT4Y+bujTaVdW-bnXWkXgZumgpueJYx1u8EysZQw30vEekw3g@mail.gmail.com>
In-Reply-To: <CACT4Y+YuS_O1hnZ0EwT-YE=J3Y9Lr=WboGgtKbcqvfz++ZO0Zg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8402994878259513516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 8:40 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hello 0-day devs,
>
> [Hope I figures correct email addresses]
>
> I have some questions regarding state of 0-day project to better
> understand state of upstream kernel testing.
>
> 1. What kernel configs does 0-day bot use? In particular I am
> interested in various runtime debugging features. Is there a list of
> all configs? I've found one in a recent "[bpf] 9fe4f05d33:
> kernel_selftests.bpf.test_verifier.fail" report, but it does not
> include CONFIG_KASAN, though I am sure 0-day uses KASAN. So is it a
> different config? Or the config was "minimized" to exclude KASAN since
> it was not relevant for the failure? I am interested in the following
> debug features: KASAN, LOCKDEP, KMEMLEAK, FAULT_INJECTION,
> DEBUG_OBJECTS, DEBUG_VM. Are these used? Any other notable debug
> features that are used?
>
> 2. What tests are being run? Is there a list somewhere?
> I know that 0-day now runs a pretty extensive set of tests. But is
> there any quantitative qualification? Are you done with onboarding
> more test suites? Or
> you want to onboard more? How would you estimate your progress on test
> onboarding? Is it 10%, 50% or 90%?
>
> 3. On a related note, do you know test code coverage? Are there
> reports available?
>
> 4. As far as I understand there is no automated reporting and a human
> is involved in sending of each report. Is it correct? What is the
> reason? You want to double-check? It's not automated? Something else?
>
> 5. Do you intercept all incoming upstream patches or you know that
> some are missing? If you don't intercept all, what are the main
> sources? I know some people send pull requests to Linus from their
> github trees and these may skip most of the common process.
>
> 6. Does it happen that 0-day fails to parse/apply a patch? I mean things
> like parsing problems when 0-day just can't make sense out of the email
> text, or when you can't figure out base tree/branch.
>
> 7. As far as I understand 0-day has some heuristics to figure out base
> git repo/branch. How frequently do they fail? How much tuning and
> maintenance does this require?
>
> 8. What are your major pain points? Or where time is going to? Major TODO=
 items?
>
> 9. How many people are working on 0-day? Or taking into account the
> project started long time ago, more relevant question is probably:
> what is the estimation of engineer-years spent on 0-day? Are there any
> major areas where the human time goes?
>
> Thanks in advance

friendly ping

--===============8402994878259513516==--


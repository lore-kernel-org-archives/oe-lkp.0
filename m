Content-Type: multipart/mixed; boundary="===============0006873312383249391=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fget] 054aa8d439: will-it-scale.per_thread_ops -5.7% regression
Date: Fri, 10 Dec 2021 10:33:43 -0800
Message-ID: <CAHk-=wgxd2DqzM3PAsFmzJDHFggxg7ODTQxfJoGCRDbjgMm8nA@mail.gmail.com>
In-Reply-To: <20211210053743.GA36420@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0006873312383249391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2021 at 9:38 PM kernel test robot <oliver.sang@intel.com> =
wrote:
>
> FYI, we noticed a -5.7% regression of will-it-scale.per_thread_ops due to=
 commit:
> 054aa8d439b9  ("fget: check that the fd still exists after getting a ref =
to it")

Well, some downside of the new checks was expected, that's just much
more than I really like or would have thought.

But it's exactly where you'd expect:

>      27.16 =C2=B1 10%      +4.3       31.51 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__fget_light.do_sys_poll.__x64_sys_poll.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>      22.91 =C2=B1 10%      +4.4       27.34 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__fget_files.__fget_light.do_sys_poll.__x64_sys_poll.do_sys=
call_64
>      26.33 =C2=B1 10%      +4.4       30.70 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__fget_light
>      22.92 =C2=B1 10%      +4.4       27.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__fget_files
>      22.70 =C2=B1 10%      +4.4       27.11 =C2=B1  2%  perf-profile.self=
.cycles-pp.__fget_files

although there's odd spikes in dTLB-loads etc.

I checked whether it's some unexpected code generation issue, but the
new "re-check file table after refcount update" really looks very
cheap when I look at what gcc generates, there's nothing really
unexpected there.

What did change was:

 (a) some branches go other ways, which might well affect branch
prediction and just be unlucky. It might be that just marking the
mismatch case "unlikely()" will help.

 (b) the obvious few new instructions (re-load and check file table
pointer, re-load and check file pointer)

 (c) that __fget_files() function is now no longer a leaf function in
a simple config case, since it calls "fput_many" in the error case.

And that (c) is worth mentioning simply because it means that the
function goes from not having any stack frame at all, to having to
save/restore four registers. So now it has the usual push/pop
sequences.

It may also be that the test-case actually does a lot of threaded
open/close/poll, and either actually triggers the re-lookup looping
case (unlikely) or just sees a lot of cacheline bouncing that now got
worse due to the re-check of the file pointer.

So this regression looks real, and the issue seems to be that
__fget_files() really is _that_ important for this do_sys_poll()
benchmark, and even just the handful of extra instructions end up
being meaningful.

Oliver - I'm attaching the obvious "unlikely9)" oneliner in case it's
just "gcc thought the retry loop was the common case" issue and bad
branch prediction.

And it would perhaps be interesting to get an actual instruction-level
profile of that __fget_files() thing for that benchmark, if that
pinpoints exactly what is going on and in case that would be easy to
get on that machine.

Because it might just be truly horrendously bad luck, with the 32-byte
stack frame meaning that the kernel stack goes one more page down
(just jhandwaving from the dTLB number spike), and this all being just
random bad luck on that particular benchmark.

Of course, the thing about poll() is that for that case, we *don't*
really need the "re-check the file descriptor" code at all, since the
resulting fd isn't going to be installed as a new fd, and it doesn't
matter for the socket garbage collector logic.

So maybe it was a mistake to put that re-check in the generic fdget()
code - yes, it should be cheap, but it's also some of the most hot
code in the kernel on some loads.

But if we move it elsewhere, we'd need to come up with some list of
"these cases need it". Some are obvious: dup, dup2, unix domain file
passing. It's the non-obvious ones I'd worry about.

Anybody?

              Linus

--===============0006873312383249391==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.diff"

IGZzL2ZpbGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL2ZpbGUuYyBiL2ZzL2ZpbGUuYwppbmRleCBhZDRhOGJm
M2NmMTAuLmY4MDIzNjBlMjQwZCAxMDA2NDQKLS0tIGEvZnMvZmlsZS5jCisrKyBiL2ZzL2ZpbGUu
YwpAQCAtODU4LDcgKzg1OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZmlsZSAqX19mZ2V0X2ZpbGVzKHN0
cnVjdCBmaWxlc19zdHJ1Y3QgKmZpbGVzLCB1bnNpZ25lZCBpbnQgZmQsCiAJCQlmaWxlID0gTlVM
TDsKIAkJZWxzZSBpZiAoIWdldF9maWxlX3JjdV9tYW55KGZpbGUsIHJlZnMpKQogCQkJZ290byBs
b29wOwotCQllbHNlIGlmIChmaWxlc19sb29rdXBfZmRfcmF3KGZpbGVzLCBmZCkgIT0gZmlsZSkg
eworCQllbHNlIGlmICh1bmxpa2VseShmaWxlc19sb29rdXBfZmRfcmF3KGZpbGVzLCBmZCkgIT0g
ZmlsZSkpIHsKIAkJCWZwdXRfbWFueShmaWxlLCByZWZzKTsKIAkJCWdvdG8gbG9vcDsKIAkJfQo=

--===============0006873312383249391==--


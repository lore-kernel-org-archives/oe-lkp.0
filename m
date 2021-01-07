Content-Type: multipart/mixed; boundary="===============8803946229126890600=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 09:43:54 -0800
Message-ID: <CAHk-=wgQ5EEH3-GTK9KDB5mBmWjP25YHXC6_-V_KfWd0UTDTDQ@mail.gmail.com>
In-Reply-To: <20210107134723.GA28532@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8803946229126890600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2021 at 5:32 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
> FYI, we noticed a -5.8% regression of will-it-scale.per_thread_ops due to=
 commit:

Ok, that's noticeable.

And:

> commit: d55564cfc222326e944893eff0c4118353e349ec ("x86: Make __put_user()=
 generate an out-of-line call")

Yeah, that wasn't supposed to cause any performance regressions. No
core code should use __put_user() so much.

But:

> | testcase: change | will-it-scale: will-it-scale.per_process_ops -7.3% r=
egression             |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GHz with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D100%                                      =
                        |
> |                  | test=3Dpoll2                                        =
                        |
> |                  | ucode=3D0x16                                        =
                        |

Ok, it's poll(), and it's definitely the __put_user() there:

>       0.00            +1.8        1.77 =C4=85  3%  perf-profile.children.=
cycles-pp.__put_user_nocheck_2
>       0.00            +1.6        1.64 =C4=85  3%  perf-profile.self.cycl=
es-pp.__put_user_nocheck_2

And in fact, it's that final "write back the 16-bit revents field" at the e=
nd.

Which must have sucked before too, because it used to do a "stac/clac"
for every word - but now it does it out of line.

The fix is to convert that loop to use "unsafe_put_user()" with the
necessary accoutrements around it, and that should speed things up
quite nicely. The (double) loop itself is actually just 14
instructions, it's ridiculous how bad the code used to be, and how
much better it is with the nice unsafe_put_user(). The whole double
loop ends up being just

        lea    0x68(%rsp),%rsi
        mov    %rcx,%rax
  1:    mov    0x8(%rsi),%ecx
        lea    0xc(%rsi),%rdx
        test   %ecx,%ecx
        je     3f
        lea    (%rax,%rcx,8),%rdi
  2:    movzwl 0x6(%rdx),%ecx
        mov    %cx,0x6(%rax)
        add    $0x8,%rax
        add    $0x8,%rdx
        cmp    %rdi,%rax
        jne    2b
  3:    mov    (%rsi),%rsi
        test   %rsi,%rsi
        jne    1b

with the attached patch.

Before, it would do the whole CLAC/STAC dance inside that loop for
every entry (and with that commit d55564cfc22 it would be a function
call, of course).

Can you verify that this fixes the regression (and in fact I'd expect
it to improve that test-case)?

NOTE! The patch is entirely untested. I verified that the code
generation now looks sane, and it all looks ObviouslyCorrect(tm) to
me, but mistakes happen and maybe I missed some detail..

               Linus

--===============8803946229126890600==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch.obj"

IGZzL3NlbGVjdC5jIHwgMTQgKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NlbGVjdC5jIGIvZnMv
c2VsZWN0LmMKaW5kZXggZWJmZWJkZmU1YzY5Li4zN2FhYTgzMTdmM2EgMTAwNjQ0Ci0tLSBhL2Zz
L3NlbGVjdC5jCisrKyBiL2ZzL3NlbGVjdC5jCkBAIC0xMDExLDE0ICsxMDExLDE3IEBAIHN0YXRp
YyBpbnQgZG9fc3lzX3BvbGwoc3RydWN0IHBvbGxmZCBfX3VzZXIgKnVmZHMsIHVuc2lnbmVkIGlu
dCBuZmRzLAogCWZkY291bnQgPSBkb19wb2xsKGhlYWQsICZ0YWJsZSwgZW5kX3RpbWUpOwogCXBv
bGxfZnJlZXdhaXQoJnRhYmxlKTsKIAorCWlmICghdXNlcl93cml0ZV9hY2Nlc3NfYmVnaW4odWZk
cywgbmZkcyAqIHNpemVvZigqdWZkcykpKQorCQlnb3RvIG91dF9mZHM7CisKIAlmb3IgKHdhbGsg
PSBoZWFkOyB3YWxrOyB3YWxrID0gd2Fsay0+bmV4dCkgewogCQlzdHJ1Y3QgcG9sbGZkICpmZHMg
PSB3YWxrLT5lbnRyaWVzOwogCQlpbnQgajsKIAotCQlmb3IgKGogPSAwOyBqIDwgd2Fsay0+bGVu
OyBqKyssIHVmZHMrKykKLQkJCWlmIChfX3B1dF91c2VyKGZkc1tqXS5yZXZlbnRzLCAmdWZkcy0+
cmV2ZW50cykpCi0JCQkJZ290byBvdXRfZmRzOworCQlmb3IgKGogPSB3YWxrLT5sZW47IGo7IGZk
cysrLCB1ZmRzKyssIGotLSkKKwkJCXVuc2FmZV9wdXRfdXNlcihmZHMtPnJldmVudHMsICZ1ZmRz
LT5yZXZlbnRzLCBFZmF1bHQpOwogICAJfQorCXVzZXJfd3JpdGVfYWNjZXNzX2VuZCgpOwogCiAJ
ZXJyID0gZmRjb3VudDsKIG91dF9mZHM6CkBAIC0xMDMwLDYgKzEwMzMsMTEgQEAgc3RhdGljIGlu
dCBkb19zeXNfcG9sbChzdHJ1Y3QgcG9sbGZkIF9fdXNlciAqdWZkcywgdW5zaWduZWQgaW50IG5m
ZHMsCiAJfQogCiAJcmV0dXJuIGVycjsKKworRWZhdWx0OgorCXVzZXJfd3JpdGVfYWNjZXNzX2Vu
ZCgpOworCWVyciA9IC1FRkFVTFQ7CisJZ290byBvdXRfZmRzOwogfQogCiBzdGF0aWMgbG9uZyBk
b19yZXN0YXJ0X3BvbGwoc3RydWN0IHJlc3RhcnRfYmxvY2sgKnJlc3RhcnRfYmxvY2spCg==

--===============8803946229126890600==--


Content-Type: multipart/mixed; boundary="===============1551398801745514118=="
MIME-Version: 1.0
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: lkp@lists.01.org
Subject: Re: [pcpu] BUG: KASAN: use-after-scope in pcpu_setup_first_chunk+0x1e3b/0x29e2
Date: Thu, 30 Nov 2017 19:58:45 +0000
Message-ID: <CAKv+Gu-4JqNiHLo+EAbiEQ+jBNUW0iuyZQs=Do+KajKaibsZuw@mail.gmail.com>
In-Reply-To: <CAGXu5j+om_oZ63OkJwGJNpVgBPxm9Nwc_JwbR3cpfugDPN7X+w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1551398801745514118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 30 November 2017 at 19:56, Kees Cook <keescook@chromium.org> wrote:
> On Thu, Nov 30, 2017 at 11:22 AM, Dennis Zhou <dennisszhou@gmail.com> w=
rote:
>> Hi Dmitry and Kees,
>>
>> On Thu, Nov 30, 2017 at 10:10:41AM -0800, Kees Cook wrote:
>>> > Are we sure that structleak plugin is not at fault? If yes, then we
>>> > need to report this to https://gcc.gnu.org/bugzilla/ with instructions
>>> > on how to build/use the plugin.
>>
>> I believe this is an issue with the structleak plugin and not gcc. The
>> bug does not show up if you compile without
>> GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
>>
>> It seems to be caused by the initializer not respecting the ASAN_MARK
>> calls. Therefore, if an inlined function gets called from a for loop,
>> the initializer code gets invoked bugging in the second iteration. Below
>> is the tree dump for the structleak plugin from the reproducer in the
>> previous email. In bb 2 of INIT_LIST_HEAD, the __u =3D {} is before the
>> unpoison call. This is inlined in bb 3 of main.
>
> Ah-ha, okay. Thanks for the close examination. Ard, is this something
> you have a few moment to take a look at?
>

I must admit that I am a bit out of my depth here. Also, I am quite
sure this is a pre-existing issue with the plugin which is triggered
more easily because it affects many more initializers.

--===============1551398801745514118==--


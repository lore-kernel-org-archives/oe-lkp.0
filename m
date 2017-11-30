Content-Type: multipart/mixed; boundary="===============0222962623193485221=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [pcpu] BUG: KASAN: use-after-scope in pcpu_setup_first_chunk+0x1e3b/0x29e2
Date: Thu, 30 Nov 2017 10:10:41 -0800
Message-ID: <CAGXu5jLOojG_Nc50KhdHsXDQQ27G+kOPp6-5kQz7Yh5Vpgucnw@mail.gmail.com>
In-Reply-To: <CACT4Y+bji1JMJVJZdv=+bD8JZ1kqrmJ0PWXvHdYzRFcnAKDSGw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0222962623193485221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 1:59 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Nov 29, 2017 at 6:54 PM, Dennis Zhou <dennisszhou@gmail.com> wr=
ote:
>> Hi everyone,
>>
>> I spent a bit of time learning more about this problem as Fengguang was
>> able to determine the root commit f7dd2507893cc3. I reproduced the bug
>> in userspace to make life a bit easier and below the assignment occurs
>> before the unpoison. This is fine if we're sequentially proceeding, but
>> as in the case in percpu, it's calling the function in a for loop
>> causing the assignment to happen after it has been poisoned in the prior
>> iteration.
>>
>> <bb 3> [0.00%]:
>>   _1 =3D (long unsigned int) i_4;
>>   _2 =3D _1 * 16;
>>   _3 =3D p_8 + _2;
>>   list_14 =3D _3;
>>   __u =3D {};
>>   ASAN_MARK (UNPOISON, &__u, 8);
>>   __u.__val =3D list_14;
>>
>> <bb 9> [0.00%]:
>>   _24 =3D __u.__val;
>>   ASAN_MARK (POISON, &__u, 8);
>>   list_14->prev =3D list_14;
>>   i_13 =3D i_4 + 1;
>>
>> <bb 10> [0.00%]:
>>   # i_4 =3D PHI <i_9(2), i_13(9)>
>>   if (i_4 <=3D 9)
>>     goto <bb 3>; [0.00%]
>>   else
>>     goto <bb 11>; [0.00%]
>>
>> I don't know how to go about fixing this though. The reproducing code is
>> below and was compiled with gcc-7 and the structleak_plugin.
>
>
> Are we sure that structleak plugin is not at fault? If yes, then we
> need to report this to https://gcc.gnu.org/bugzilla/ with instructions
> on how to build/use the plugin.

I thought from earlier in this thread that the bug just changed
locations depending on the plugin. Does the issue still exist with the
plugin disabled?

-Kees

>
>
>> I hope this helps.
>>
>> Thanks,
>> Dennis
>>
>> ----
>> #include <stdint.h>
>> #include <stdlib.h>
>>
>> #define barrier()
>>
>> #define WRITE_ONCE(x, val) \
>> ({                                                      \
>>         union { typeof(x) __val; char __c[1]; } __u =3D   \
>>                 { .__val =3D (typeof(x)) (val) }; \
>>         __write_once_size(&(x), __u.__c, sizeof(x));    \
>>         __u.__val;                                      \
>> })
>>
>> typedef         uint8_t         __u8;
>> typedef         uint16_t        __u16;
>> typedef         uint32_t        __u32;
>> typedef         uint64_t        __u64;
>>
>> static inline __attribute__((always_inline)) void __write_once_size(vola=
tile void *p, void *res, int size)
>> {
>>         switch (size) {
>>         case 1: *(volatile __u8 *)p =3D *(__u8 *)res; break;
>>         case 2: *(volatile __u16 *)p =3D *(__u16 *)res; break;
>>         case 4: *(volatile __u32 *)p =3D *(__u32 *)res; break;
>>         case 8: *(volatile __u64 *)p =3D *(__u64 *)res; break;
>>         default:
>>                 barrier();
>>                 __builtin_memcpy((void *)p, (const void *)res, size);
>>                 barrier();
>>         }
>> }
>>
>> struct list_head {
>>         struct list_head *next, *prev;
>> };
>>
>> static inline __attribute__((always_inline)) void INIT_LIST_HEAD(struct =
list_head *list)
>> {
>>         WRITE_ONCE(list->next, list);
>>         list->prev =3D list;
>> }
>>
>> int main(int argc, char *argv[])
>> {
>>         struct list_head *p =3D malloc(10 * sizeof(struct list_head));
>>         int i;
>>
>>         for (i =3D 0; i < 10; i++) {
>>                 INIT_LIST_HEAD(&p[i]);
>>         }
>>
>>         free(p);
>>
>>         return 0;
>> }



-- =

Kees Cook
Pixel Security

--===============0222962623193485221==--


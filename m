Content-Type: multipart/mixed; boundary="===============1890992862910146617=="
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] objtool, static_call: Don't emit static_call_site for .exit.text
Date: Wed, 17 Mar 2021 19:07:07 +0530
Message-ID: <CAFA6WYNr8SR=20LKJD0+AyrVXLY2CqQPqRE_60EestYv9L5AcA@mail.gmail.com>
In-Reply-To: <YFH6BR61b5GK8ITo@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1890992862910146617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Mar 2021 at 18:16, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Mar 17, 2021 at 05:25:48PM +0530, Sumit Garg wrote:
> > Thanks Peter for this fix. It does work for me on qemu for x86. Can
> > you turn this into a proper fix patch? BTW, feel free to add:
>
> Per the below, the original patch ought to be fixed as well, to not use
> static_call() in __exit.

Okay, fair enough.

Jarkko,

Can you please incorporate the following change to the original patch as we=
ll?

diff --git a/security/keys/trusted-keys/trusted_core.c
b/security/keys/trusted-keys/trusted_core.c
index ec3a066a4b42..bef52d1ebe5e 100644
--- a/security/keys/trusted-keys/trusted_core.c
+++ b/security/keys/trusted-keys/trusted_core.c
@@ -41,7 +41,7 @@ DEFINE_STATIC_CALL_NULL(trusted_key_unseal,
                        *trusted_key_sources[0].ops->unseal);
 DEFINE_STATIC_CALL_NULL(trusted_key_get_random,
                        *trusted_key_sources[0].ops->get_random);
-DEFINE_STATIC_CALL_NULL(trusted_key_exit, *trusted_key_sources[0].ops->exi=
t);
+static void (*trusted_key_exit)(void);
 static unsigned char migratable;

 enum {
@@ -328,8 +328,7 @@ static int __init init_trusted(void)
                                   trusted_key_sources[i].ops->unseal);
                static_call_update(trusted_key_get_random,
                                   trusted_key_sources[i].ops->get_random);
-               static_call_update(trusted_key_exit,
-                                  trusted_key_sources[i].ops->exit);
+               trusted_key_exit =3D trusted_key_sources[i].ops->exit;
                migratable =3D trusted_key_sources[i].ops->migratable;

                ret =3D static_call(trusted_key_init)();
@@ -349,7 +348,8 @@ static int __init init_trusted(void)

 static void __exit cleanup_trusted(void)
 {
-       static_call(trusted_key_exit)();
+       if (trusted_key_exit)
+               trusted_key_exit();
 }

 late_initcall(init_trusted);

-Sumit

>
> ---
> Subject: objtool,static_call: Don't emit static_call_site for .exit.text
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Wed Mar 17 13:35:05 CET 2021
>
> Functions marked __exit are (somewhat surprisingly) discarded at
> runtime when built-in. This means that static_call(), when used in
> __exit functions, will generate static_call_site entries that point
> into reclaimed space.
>
> Simply skip such sites and emit a WARN about it. By not emitting a
> static_call_site the site will remain pointed at the trampoline, which
> is also maintained, so things will work as expected, albeit with the
> extra indirection.
>
> The WARN is so that people are aware of this; and arguably it simply
> isn't a good idea to use static_call() in __exit code anyway, since
> module unload is never a performance critical path.
>
> Reported-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  tools/objtool/check.c |   32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
>
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -850,6 +850,22 @@ static int add_ignore_alternatives(struc
>         return 0;
>  }
>
> +static inline void static_call_add(struct instruction *insn,
> +                                  struct objtool_file *file)
> +{
> +       if (!insn->call_dest->static_call_tramp)
> +               return;
> +
> +       if (!strcmp(insn->sec->name, ".exit.text")) {
> +               WARN_FUNC("static_call in .exit.text, skipping inline pat=
ching",
> +                         insn->sec, insn->offset);
> +               return;
> +       }
> +
> +       list_add_tail(&insn->static_call_node,
> +                     &file->static_call_list);
> +}
> +
>  /*
>   * Find the destination instructions for all jumps.
>   */
> @@ -888,10 +904,7 @@ static int add_jump_destinations(struct
>                 } else if (insn->func) {
>                         /* internal or external sibling call (with reloc)=
 */
>                         insn->call_dest =3D reloc->sym;
> -                       if (insn->call_dest->static_call_tramp) {
> -                               list_add_tail(&insn->static_call_node,
> -                                             &file->static_call_list);
> -                       }
> +                       static_call_add(insn, file);
>                         continue;
>                 } else if (reloc->sym->sec->idx) {
>                         dest_sec =3D reloc->sym->sec;
> @@ -950,10 +963,7 @@ static int add_jump_destinations(struct
>
>                                 /* internal sibling call (without reloc) =
*/
>                                 insn->call_dest =3D insn->jump_dest->func;
> -                               if (insn->call_dest->static_call_tramp) {
> -                                       list_add_tail(&insn->static_call_=
node,
> -                                                     &file->static_call_=
list);
> -                               }
> +                               static_call_add(insn, file);
>                         }
>                 }
>         }
> @@ -2746,10 +2756,8 @@ static int validate_branch(struct objtoo
>                         if (dead_end_function(file, insn->call_dest))
>                                 return 0;
>
> -                       if (insn->type =3D=3D INSN_CALL && insn->call_des=
t->static_call_tramp) {
> -                               list_add_tail(&insn->static_call_node,
> -                                             &file->static_call_list);
> -                       }
> +                       if (insn->type =3D=3D INSN_CALL)
> +                               static_call_add(insn, file);
>
>                         break;
>
--===============1890992862910146617==--


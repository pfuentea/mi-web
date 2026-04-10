from .access import get_current_curso, get_user_cursos, can_manage_curso


def curso_context(request):
    if not request.user.is_authenticated:
        return {}
    current_curso = get_current_curso(request)
    user_cursos = get_user_cursos(request.user)
    puede_gestionar = False
    if current_curso:
        puede_gestionar = can_manage_curso(request.user, current_curso)
    return {
        'current_curso': current_curso,
        'user_cursos': user_cursos,
        'puede_gestionar': puede_gestionar,
    }
